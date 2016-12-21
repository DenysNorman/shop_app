class CreateFeatureValues < ActiveRecord::Migration[5.0]
  def change
    create_table :feature_values do |t|
      t.string :title
      t.belongs_to :feature, foreign_key: true
      t.belongs_to :product, foreign_key: true

      t.timestamps
    end
  end
end
