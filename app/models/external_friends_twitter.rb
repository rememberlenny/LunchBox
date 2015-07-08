class ExternalFriendsTwitter < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :owner_id, :user_id
  validates_uniqueness_of :owner_id, :scope => [:user_id]
end
