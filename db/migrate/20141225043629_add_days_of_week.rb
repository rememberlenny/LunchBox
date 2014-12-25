class AddDaysOfWeek < ActiveRecord::Migration
  def change
    add_column :users, :days_of_week, :string
    add_column :users, :time_of_day, :string
  end
end
