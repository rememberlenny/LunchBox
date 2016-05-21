class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :check_user_status
  before_filter :ensure_signup_complete, only: [:new, :create, :update, :destroy]

  def check_user_status
    if !current_user.nil?
      places = [current_user.loc_bushwick, current_user.loc_downtown, current_user.loc_harlem, current_user.loc_midtown, current_user.loc_queens, current_user.loc_redhook, current_user.loc_ues, current_user.loc_uws, current_user.loc_williamsburg]
      times = [current_user.dow_mo, current_user.dow_tu, current_user.dow_we, current_user.dow_th, current_user.dow_fr, current_user.dow_sa, current_user.dow_su]
      places_set = places.include? true
      times_set = times.include? true
      if( places_set && times_set )
        current_user.active_status = true
      else
        current_user.active_status = false
      end
    end
  end

  def ensure_signup_complete
    # Ensure we don't go into an infinite loop
    return if action_name == 'finish_signup'

    # Redirect to the 'finish_signup' page if the user
    # email hasn't been verified yet
    if current_user && !current_user.email_verified?
      redirect_to finish_signup_path(current_user)
    end
  end

  protected
end
