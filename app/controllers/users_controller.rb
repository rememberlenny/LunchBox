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

  # GET/PATCH /users/:id/finish_signup
  def finish_signup
    intercom_custom_data.user['finished_signup'] = Time.now
    @user = current_user

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
      accessible = [ :name, :email, :time_of_day, :days_of_week ] # extend with your own params
      accessible << [ :address, :longitude, :latitude ]
      accessible << [ :loc_bushwick, :loc_downtown, :loc_harlem ]
      accessible << [ :loc_midtown, :loc_queens, :loc_redhook ]
      accessible << [ :loc_ues, :loc_uws, :loc_williamsburg ]
      accessible << [ :dow_mo, :dow_tu, :dow_we, :dow_th, :dow_fr ]
      accessible << [ :dow_sa, :dow_su ]
      accessible << [ :password, :password_confirmation ] unless params[:user][:password].blank?
      params.require(:user).permit(accessible)
    end
end
