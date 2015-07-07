class RegistrationsController < Devise::RegistrationsController

  before_filter :configure_permitted_parameters

  def configure_permitted_parameters
    registration_params = [
      :loc_bushwick,
      :loc_downtown,
      :loc_harlem,
      :loc_midtown,
      :loc_queens,
      :loc_redhook,
      :loc_ues,
      :loc_uws,
      :loc_williamsburg,
      :dow_mo,
      :dow_tu,
      :dow_we,
      :dow_th,
      :dow_fr,
      :dow_sa,
      :dow_su
    ]
    devise_parameter_sanitizer.for(:account_update).push(registration_params)
  end

  protected

  def update_resource(resource, params)
    intercom_custom_data.user.meeting_locations = [user.loc_bushwick, user.loc_downtown, user.loc_harlem, user.loc_midtown, user.loc_queens, user.loc_redhook, user.loc_ues, user.loc_uws, user.loc_williamsburg] }
    intercom_custom_data.user.meeting_days = [ user.dow_mo, user.dow_tu, user.dow_we, user.dow_th, user.dow_fr, user.dow_sa, user.dow_su ] }

    resource.update_without_password(params)
  end
end
