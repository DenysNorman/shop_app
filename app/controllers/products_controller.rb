class ProductsController < ApplicationController
  before_action :set_product,  only: [:show, :edit, :update, :destroy]
  require 'will_paginate/array'
  def index
    if params[:search]
     @products = Product.where('title LIKE ?', "%#{params[:search]}%").by_created.page(params[:page]).per_page(9)
    else
     @products = Product.all.by_created.page(params[:page]).per_page(9)
    end
  end

  def show
    @product_ass = association
    @product_ass = @product_ass.paginate(page: params[:page], per_page: 2 )
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
       products = eval(cookies[:cart])
       if !products.include?({ product_id: product_id, quantity: 1 })
         product = { product_id: product_id, quantity: 1 }
         products << product
         cookies[:cart] = products.to_s
       end
     else
      cookies[:cart] = [{ product_id: product_id, quantity: 1 }].to_s
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

  def association
    product_as = []
    @product = Product.find(params[:id])
    @product.related_products.each do |t|
      product_as << t.associated
    end
    @product.related_products_associated.each do |t|
      product_as << t.product
    end
    product_as
  end

end
