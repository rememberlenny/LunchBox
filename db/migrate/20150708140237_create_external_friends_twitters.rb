class CreateExternalFriendsTwitters < ActiveRecord::Migration
  def change
    create_table :external_friends_twitters do |t|
      t.integer :owner_id
      t.integer :user_id
      t.string :screen_name
      t.string :name
      t.string :profile_image_url
      t.string :location
      t.string :description

      t.timestamps null: false
    end
  end
end
