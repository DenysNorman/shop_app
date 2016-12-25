class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :phone
      t.string :name
      t.string :email
      t.string :status

      t.timestamps
    end
  end
end
