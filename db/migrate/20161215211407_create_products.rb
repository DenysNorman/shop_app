class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :title
      t.belongs_to :category, foreign_key: true
      t.decimal :price, precision: 5, scale: 2
      t.text :description
      t.string :photo
      t.boolean :in_stock

      t.timestamps
    end
  end
end
