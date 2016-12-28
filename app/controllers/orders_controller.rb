class OrdersController < ApplicationController

  def index
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.create(order_params)
    make_order_product(@order.id)
    redirect_to root_url
  end

  def destroy
  end

  def delete_cart_product
    product_id = params[:id]
    products = cookies[:cart].split(',')
    products.delete(product_id)
    cookies[:cart] = products.join(',')
    redirect_to :back
  end

  def put_quantity
    products = cookies[:cart].split(',')
    products.each do |p|
      q = "quantitys_#{p}".to_sym
      qty = params[:quantity][q][:qty]
      if cookies[:qty].present?
        qtys = cookies[:qty].split(',')
        qtys << qty
        cookies[:qty] = qtys.join(',')
      else
        cookies[:qty] = qty
      end
    end
    redirect_to new_order_path
  end

  private

  def order_params
    params.require(:order).permit(:name, :phone,
                                  :email, :status)
  end

  def make_order_product(order_id)
    products = cookies[:cart].split(',')
    quantitys = cookies[:qty].split(',')
    products.each do |p|
      n = products.index(p)
      OrderProduct.create(product_id: p, order_id: order_id,
                   actual_price: Product.find(p).price, quantity: quantitys[n])
    end
  end
end
