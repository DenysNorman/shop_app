class OrdersController < ApplicationController

  def index
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.create(order_params)
    respond_to do |format|
      if @order.save
        format.html do
          products = cookies[:cart]
          @order.place(products, @order.id)
          AdminMailer.order_confirmation(@order).deliver
          CustomerMailer.order_confirmation(@order).deliver
          cookies.delete :cart
          redirect_to root_url,
                      flash:  {notice: "Order created, wait for email"}
        end
      else
        format.html  { render :new }
      end
    end
  end

  def destroy
  end

  def delete_cart_product
    product_id = params[:id]
    products = eval(cookies[:cart])
    products.delete_if { |h| h[:product_id] == product_id }
    cookies[:cart] = products.to_s
    redirect_to :back
  end

  def put_quantity
    products = eval(cookies[:cart])
    products.each do |p|
      q = "quantitys_#{p[:product_id]}".to_sym
      qty = params[:quantity][q][:qty]
      p[:quantity] = qty
    end
    cookies[:cart] = products.to_s
    redirect_to new_order_path
  end


  private

  def order_params
    params.require(:order).permit(:name, :phone,
                                  :email, :status)
  end

end
