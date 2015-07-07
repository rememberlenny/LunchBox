class AddEmailSettingsToUser < ActiveRecord::Migration
  def change
    add_column :users, :email_frequency, :string, default: 'daily' # immediate, daily, weekly
  end
end
