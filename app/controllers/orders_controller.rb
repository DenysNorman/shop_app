class OrdersController < ApplicationController
  def index
  end

  def new
  end

  def create
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
    #тут нужно передать значение в куку
  end
end
