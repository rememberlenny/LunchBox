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
    u = current_user
    intercom_custom_data.user['meeting_locations'] = [u.loc_bushwick, u.loc_downtown, u.loc_harlem, u.loc_midtown, u.loc_queens, u.loc_redhook, u.loc_ues, u.loc_uws, u.loc_williamsburg]
    intercom_custom_data.user['meeting_days'] = [ u.dow_mo, u.dow_tu, u.dow_we, u.dow_th, u.dow_fr, u.dow_sa, u.dow_su ]
    resource.update_without_password(params)
  end
end
