class AddSocialTwitterDataToUser < ActiveRecord::Migration
  def change
    add_column :users, :twitter_followers_count, :integer, default: 0
    add_column :users, :twitter_friends_count, :integer, default: 0
    add_column :users, :twitter_access_token, :string
    add_column :users, :description, :string, default: ''
  end
end
