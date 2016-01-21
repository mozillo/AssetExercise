class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.string :asset_manage_seq
      t.string :user_uuid
      t.integer :admin_id
      t.string :action_type
      t.integer :qty

      t.timestamps null: false
    end
    add_index :logs, :asset_manage_seq
    add_index :logs, :user_uuid
  end
end
