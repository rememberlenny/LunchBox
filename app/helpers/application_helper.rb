module ApplicationHelper
  def current_user_status_active
    if !current_user.nil?

    end
  end

  def current_user_locations_active
    if !current_user.nil?
      places = ['loc_bushwick', 'loc_downtown', 'loc_harlem', 'loc_midtown', 'loc_queens', 'loc_redhook', 'loc_ues', 'loc_uws', 'loc_williamsburg']
      places.each do |place|
        if current_user[place] == true
          return true
        end
      end
      return false
    else
      return false
    end
  end

  def current_user_days_active
    if !current_user.nil?
      times = ['dow_mo', 'dow_tu', 'dow_we', 'dow_th', 'dow_fr', 'dow_sa', 'dow_su']
      times.each do |time|
        if current_user[time] == true
          return true
        end
      end
      return false
    else
      return false
    end
  end
end
