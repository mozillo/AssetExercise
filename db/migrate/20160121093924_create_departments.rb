class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :department_name,		null: false
      t.string :dept_uuid, 					null: false
      t.integer :budget
      t.integer :admin_id
      t.timestamps null: false
    end

    add_index :departments, :dept_uuid, :unique => true
  end
end
