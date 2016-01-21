class CreateAssetManages < ActiveRecord::Migration
  def change
    create_table :asset_manages do |t|
      t.string :brand
      t.string :category
      t.string :model
      t.integer :owner_id
      t.string :producer
      t.string :product
      t.decimal :price, precision: 8 , scale: 2
      t.integer :qty
      t.integer :stock_in_number
      t.integer :stock_out_number
      t.integer :unit
      t.text :remarks
      t.string :seq

      t.timestamps null: false
    end

    add_index :asset_manages, :seq, :unique => true
  end
end
