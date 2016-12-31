class Order < ApplicationRecord
  has_many :order_products, dependent: :destroy

  def place(products, order_id)
    products = eval(products)
    products.each do |p|
      OrderProduct.create(product_id: p[:product_id], order_id: order_id,
                          actual_price: Product.find(p[:product_id]).price, quantity: p[:quantity])
    end
  end
end
