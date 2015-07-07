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
      :dow_su,
      :avatar
    ]
    devise_parameter_sanitizer.for(:account_update).push(registration_params)
  end

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end
