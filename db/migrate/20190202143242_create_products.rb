class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.date :expire_date
      t.integer :sku_id
      t.decimal :price

      t.timestamps null: false
    end
  end
end
