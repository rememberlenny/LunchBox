class RemoveTimeOfDay < ActiveRecord::Migration
  def change
     remove_column :users, :time_of_day
     remove_column :users, :days_of_week
  end
end
