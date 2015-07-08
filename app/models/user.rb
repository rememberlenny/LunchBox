class User < ActiveRecord::Base
  TEMP_EMAIL_PREFIX = 'change@me'
  TEMP_EMAIL_REGEX = /\Achange@me/
  has_many :identities,  dependent: :destroy
  has_many :external_friends_twitter,  dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable,
  # :lockable, :timeoutable
  devise :uid, :invitable, :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :omniauthable,
    :invitable

  validates_format_of :email, :without => TEMP_EMAIL_REGEX, on: :update

  mount_uploader :avatar, AvatarUploader

  def self.save_external_network user_id, follower_ids, source, relationship
    user = User.find user_id
    follower_ids.to_a
    follower_ids.each do |follower_id|
      ExternalFriends.create(owner_id: user_id, user_id: follower_id, source: source, relationship: relationship)
    end
  end

  def self.get_user_followers user_id
    user = User.find user_id
    follower_ids = Twit.follower_ids(user.username)
    begin
      follower_ids.to_a
    rescue Twitter::Error::TooManyRequests => error
      # NOTE: Your process could go to sleep for up to 15 minutes but if you
      # retry any sooner, it will almost certainly fail with the same exception.
      sleep error.rate_limit.reset_in + 1
      retry
    end

    User.save_twitter_network( user_id, follower_ids, 'twitter', 'follower' )
  end

  def self.find_for_oauth(auth, signed_in_resource = nil)

    # Get the identity and user if they exist
    identity = Identity.find_for_oauth(auth)

    # If a signed_in_resource is provided it always overrides the existing user
    # to prevent the identity being locked with accidentally created accounts.
    # Note that this may leave zombie accounts (with no associated identity) which
    # can be cleaned up at a later date.
    user = signed_in_resource ? signed_in_resource : identity.user

    # Create the user if needed
    if user.nil?

      # Get the existing user by email if the provider gives us a verified email.
      # If no verified email was provided we assign a temporary email and ask the
      # user to verify it on the next step via UsersController.finish_signup
      email_is_verified = auth.info.email && (auth.info.verified || auth.info.verified_email)
      email = auth.info.email if email_is_verified
      user = User.where(:email => email).first if email

      # Create the user if it's a new registration
      if user.nil?
        user = User.new(
          name: auth.extra.raw_info.name,
          avatar: auth.info.image,
          username: auth.info.nickname || auth.uid,
          email: email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com",
          password: Devise.friendly_token[0,20],
          description: auth.extra.raw_info.description,
          twitter_followers_count: auth.extra.raw_info.followers_count,
          twitter_friends_count: auth.extra.raw_info.friends_count,
          twitter_access_token: auth.access_token,
        )
        user.save!
      end
    end

    # Associate the identity with the user if needed
    if identity.user != user
      identity.user = user
      identity.save!
    end
    user
  end

  def self.process_all_users
    uu = User.all
    uu.each do |u|
      config.user.current = Proc.new { u }
      intercom_custom_data.user['twitter'] = u.username
      intercom_custom_data.user['twitter_followers_count'] = u.twitter_followers_count
      intercom_custom_data.user['twitter_friends_count'] = u.twitter_friends_count
      intercom_custom_data.user['count_meeting_locations'] = [u.loc_bushwick, u.loc_downtown, u.loc_harlem, u.loc_midtown, u.loc_queens, u.loc_redhook, u.loc_ues, u.loc_uws, u.loc_williamsburg].select{|place| place == true }.size
      intercom_custom_data.user['count_meeting_days'] = [ u.dow_mo, u.dow_tu, u.dow_we, u.dow_th, u.dow_fr, u.dow_sa, u.dow_su ].select{|day| day == true }.siz
    end
  end

  def email_verified?
    self.email && self.email !~ TEMP_EMAIL_REGEX
  end
end
