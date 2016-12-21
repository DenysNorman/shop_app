class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :author
      t.belongs_to :product, foreign_key: true
      t.text :body
      t.integer :rating
      t.string :email
      t.boolean :published, default: false

      t.timestamps
    end
  end
end
