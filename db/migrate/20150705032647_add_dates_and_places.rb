class AddDatesAndPlaces < ActiveRecord::Migration
  def change
    add_column :users, :loc_bushwick, :boolean
    add_column :users, :loc_downtown, :boolean
    add_column :users, :loc_harlem, :boolean
    add_column :users, :loc_midtown, :boolean
    add_column :users, :loc_queens, :boolean
    add_column :users, :loc_redhook, :boolean
    add_column :users, :loc_ues, :boolean
    add_column :users, :loc_uws, :boolean
    add_column :users, :loc_williamsburg, :boolean
    add_column :users, :dow_mo, :boolean
    add_column :users, :dow_tu, :boolean
    add_column :users, :dow_we, :boolean
    add_column :users, :dow_th, :boolean
    add_column :users, :dow_fr, :boolean
    add_column :users, :dow_sa, :boolean
    add_column :users, :dow_su, :boolean
  end
end

