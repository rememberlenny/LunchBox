class AddLocationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :longitude, :integer
    add_column :users, :latitude, :integer
  end
end
