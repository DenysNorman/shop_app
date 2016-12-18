class CategoriesController < ApplicationController
  before_action :set_category,  only: [:show, :edit, :update, :destroy]

  def show
    @products = @category.products
  end

  def new
    @category = Category.new(parent_id: params[:parent_id])
  end

  def create
    @category = Category.create(category_params)
  end

  def edit
  end

  def update
    @category.update(category_params)
    redirect_to root_path
  end


  private
  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title, :parent_id)
  end
end
