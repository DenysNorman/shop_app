class CreateOrderProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :order_products do |t|
      t.belongs_to :product, foreign_key: true
      t.belongs_to :order
      t.decimal :actual_price, precision: 5, scale: 2
      t.integer :quantity

      t.timestamps
    end
  end
end
