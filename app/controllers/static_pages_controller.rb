class StaticPagesController < ApplicationController

  def setup_user
  end

  def home
    @user = current_user
    u = current_user
    intercom_custom_data.user['count_meeting_locations'] = return [u.loc_bushwick, u.loc_downtown, u.loc_harlem, u.loc_midtown, u.loc_queens, u.loc_redhook, u.loc_ues, u.loc_uws, u.loc_williamsburg].select{|place| place == true }.size
    intercom_custom_data.user['count_meeting_days'] = return [ u.dow_mo, u.dow_tu, u.dow_we, u.dow_th, u.dow_fr, u.dow_sa, u.dow_su ].select{|day| day == true }.size
  end

  def about
  end

  def contact
  end

end
