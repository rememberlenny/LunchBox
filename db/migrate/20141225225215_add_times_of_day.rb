class AddTimesOfDay < ActiveRecord::Migration
  def change
    add_column :users, :tod_morning_early, :boolean
    add_column :users, :tod_morning_middle, :boolean
    add_column :users, :tod_morning_late, :boolean
    add_column :users, :dow_monday, :boolean
    add_column :users, :dow_tuesday, :boolean
    add_column :users, :dow_wednesday, :boolean
    add_column :users, :dow_thursday, :boolean
    add_column :users, :dow_friday, :boolean
    add_column :users, :dow_saturday, :boolean
    add_column :users, :dow_sunday, :boolean
  end
end
