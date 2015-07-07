class UsersController < ApplicationController
  before_action :set_user, only: [:account_cancel, :setup, :show, :assign_meeting, :edit, :update, :destroy]

  # GET /users/:id.:format
  def show
    # authorize! :read, @user
  end

  def setup

  end

  def account_cancel

  end

  # GET /users/:id/edit
  def edit
    # authorize! :update, @user
  end

  def assign_meeting
    # authorize! :update, @user
  end

  # PATCH/PUT /users/:id.:format
  def update
    intercom_custom_data.user['updated_user_data'] = Time.now
    # authorize! :update, @user
    respond_to do |format|
      if @user.update(user_params)
        u = current_user
        sign_in(@user == current_user ? @user : current_user, :bypass => true)
        format.html { redirect_to @user, notice: 'Your profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def invite_user
    @user = User.invite!(:email => params[:user][:email], :name => params[:user][:name])
    render :json => @user
  end

  def deactivate_user
    intercom_custom_data.user['deactivated_user'] = Time.now
    user = User.find(current_user.id)
    places = ['loc_bushwick', 'loc_downtown', 'loc_harlem', 'loc_midtown', 'loc_queens', 'loc_redhook', 'loc_ues', 'loc_uws', 'loc_williamsburg']
    times = ['dow_mo', 'dow_tu', 'dow_we', 'dow_th', 'dow_fr', 'dow_sa', 'dow_su']
    places.each do |place|
      user[place] = false
    end
    times.each do |time|
      user[time] = false
    end
    user.save
    redirect_to root_path , notice: 'Your profile was successfully updated.'
  end

  # GET/PATCH /users/:id/finish_signup
  def finish_signup
    u = current_user
    @user = u
    intercom_custom_data.user['finished_signup'] = Time.now
    intercom_custom_data.user['twitter'] = u.username
    intercom_custom_data.user['twitter_followers_count'] = u.twitter_followers_count
    intercom_custom_data.user['twitter_friends_count'] = u.twitter_friends_count
    intercom_custom_data.user['count_meeting_locations'] = [u.loc_bushwick, u.loc_downtown, u.loc_harlem, u.loc_midtown, u.loc_queens, u.loc_redhook, u.loc_ues, u.loc_uws, u.loc_williamsburg].select{|place| place == true }.size
    intercom_custom_data.user['count_meeting_days'] = [ u.dow_mo, u.dow_tu, u.dow_we, u.dow_th, u.dow_fr, u.dow_sa, u.dow_su ].select{|day| day == true }.size


    # authorize! :update, @user
    if request.patch? && params[:user] #&& params[:user][:email]
      if @user.update(user_params)
        # @user.skip_reconfirmation!
        sign_in(@user, :bypass => true)
        redirect_to root_path , notice: 'Your profile was successfully updated.'
      else
        @show_errors = true
      end
    end
  end

  # DELETE /users/:id.:format
  def destroy
    intercom_custom_data.user['destroyed_app_at'] = Time.now
    # authorize! :delete, @user
    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      if params[:id] == nil
        @user = current_user
      else
        @user = User.find(params[:id])
      end
    end

    def user_params
      accessible = [ :name, :email ] # extend with your own params
      accessible << [ :address, :longitude, :latitude, :avatar ]
      accessible << [ :description, :twitter_followers_count, :twitter_friends_count, :twitter_access_token ]
      accessible << [ :loc_bushwick, :loc_downtown, :loc_harlem ]
      accessible << [ :loc_midtown, :loc_queens, :loc_redhook ]
      accessible << [ :loc_ues, :loc_uws, :loc_williamsburg ]
      accessible << [ :dow_mo, :dow_tu, :dow_we, :dow_th, :dow_fr ]
      accessible << [ :dow_sa, :dow_su ]
      accessible << [ :password, :password_confirmation ] unless params[:user][:password].blank?
      params.require(:user).permit(accessible)
    end
end
