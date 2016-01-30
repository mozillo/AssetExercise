class AddMasterToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :is_master, :boolean, default: false
  end
end
