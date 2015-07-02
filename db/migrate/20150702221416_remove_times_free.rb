class RemoveTimesFree < ActiveRecord::Migration
  def change
    remove_column :users, :tod_morning_early
    remove_column :users, :tod_morning_middle
    remove_column :users, :tod_morning_late
    remove_column :users, :dow_monday
    remove_column :users, :dow_tuesday
    remove_column :users, :dow_wednesday
    remove_column :users, :dow_thursday
    remove_column :users, :dow_friday
    remove_column :users, :dow_saturday
    remove_column :users, :dow_sunday
  end
end
