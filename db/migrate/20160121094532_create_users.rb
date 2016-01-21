class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :dept_uuid,  null: false
      t.string :username,   null: false
      t.string :uuid,       null: false
      t.integer :budget

      t.timestamps null: false
    end

    add_index :users, :dept_uuid
    add_index :users, :uuid, :unique => true
  end
end
