class AddTimeOfDay < ActiveRecord::Migration
  def change
    add_column :users, :time_of_day, :string
  end
end
