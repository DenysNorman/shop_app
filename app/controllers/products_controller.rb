class ProductsController < ApplicationController
  before_action :set_product,  only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    redirect_to @product
  end

  def edit
  end

  def update
    @product.update(product_params)
    redirect_to product_path
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end

  def add_to_cart
    product_id = params[:id]
    if cookies[:cart].present?
      products = cookies[:cart].split(',')
      if !products.include?(product_id)
        products << product_id
        cookies[:cart] = products.join(',')
        end
    else
      cookies[:cart] = product_id
    end
    redirect_to :back
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :price,
                                    :photo, :description,
                                    :in_stock, :category_id)
  end

end
