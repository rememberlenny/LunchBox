class AddNewLimitToInt < ActiveRecord::Migration
  def change
    change_column :external_friends_twitters, :user_id, :integer, :limit => 8
  end
end
