class Order < ApplicationRecord
  has_many :order_products

  def place(products)

  end
end
