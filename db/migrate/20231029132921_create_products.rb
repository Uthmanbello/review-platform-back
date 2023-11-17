class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.decimal :delivery_cost
      t.string :delivery_time
      t.string :vendor
      t.text :description
      t.integer :quantity
      t.string :size
      t.references :sub_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
