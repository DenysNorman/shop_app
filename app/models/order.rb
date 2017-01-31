class Order < ApplicationRecord
  has_many :order_products, dependent: :destroy
  enum status_keys: {
      'Processing' => 0,
      'Shipped' => 1,
      'Received' => 2
  }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX }
  validates :name, presence: true, length: { maximum: 40 }
  validates :phone, presence: true, length: { maximum: 11 }

  def place(products, order_id)
    products = eval(products)
    products.each do |p|
      OrderProduct.create(product_id: p[:product_id], order_id: order_id,
                          actual_price: Product.find(p[:product_id]).price, quantity: p[:quantity])
    end
  end

  def total_price(order)
    @price = 0
    OrderProduct.where(order_id: order.id).each do |f|
      @price += f.actual_price * f.quantity
    end
    @price
  end
end
