class AddDaysOfWeek < ActiveRecord::Migration
  def change
    add_column :users, :days_of_week, :string
  end
end
