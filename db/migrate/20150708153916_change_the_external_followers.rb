class ChangeTheExternalFollowers < ActiveRecord::Migration
  def change
    create_table :external_friends do |t|
      t.integer :owner_id
      t.integer :user_id, :limit => 8
      t.string :relationship
      t.string :source
      t.string :screen_name
      t.string :name
      t.string :profile_image_url
      t.string :location
      t.string :description

      t.timestamps null: false
    end
  end
end
