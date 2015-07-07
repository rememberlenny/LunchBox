class AddDefaultStatus < ActiveRecord::Migration
  def change
    remove_column :users, :loc_bushwick
    remove_column :users, :loc_downtown
    remove_column :users, :loc_harlem
    remove_column :users, :loc_midtown
    remove_column :users, :loc_queens
    remove_column :users, :loc_redhook
    remove_column :users, :loc_ues
    remove_column :users, :loc_uws
    remove_column :users, :loc_williamsburg
    remove_column :users, :dow_mo
    remove_column :users, :dow_tu
    remove_column :users, :dow_we
    remove_column :users, :dow_th
    remove_column :users, :dow_fr
    remove_column :users, :dow_sa
    remove_column :users, :dow_su
    add_column :users, :loc_bushwick, :boolean, default: false
    add_column :users, :loc_downtown, :boolean, default: false
    add_column :users, :loc_harlem, :boolean, default: false
    add_column :users, :loc_midtown, :boolean, default: false
    add_column :users, :loc_queens, :boolean, default: false
    add_column :users, :loc_redhook, :boolean, default: false
    add_column :users, :loc_ues, :boolean, default: false
    add_column :users, :loc_uws, :boolean, default: false
    add_column :users, :loc_williamsburg, :boolean, default: false
    add_column :users, :dow_mo, :boolean, default: false
    add_column :users, :dow_tu, :boolean, default: false
    add_column :users, :dow_we, :boolean, default: false
    add_column :users, :dow_th, :boolean, default: false
    add_column :users, :dow_fr, :boolean, default: false
    add_column :users, :dow_sa, :boolean, default: false
    add_column :users, :dow_su, :boolean, default: false
  end
end
