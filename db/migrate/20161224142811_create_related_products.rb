class CreateRelatedProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :related_products do |t|
      t.belongs_to :product, foreign_key: true
      t.integer :associated_id

      t.timestamps
    end
  end
end
