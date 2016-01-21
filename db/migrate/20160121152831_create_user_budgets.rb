class CreateUserBudgets < ActiveRecord::Migration
  def change
    create_table :user_budgets do |t|
      t.integer :user_id
      t.integer :admin_id
      t.integer :budget_num
      t.text :budget_note

      t.timestamps null: false
    end
  end
end
