class ReviewsController < ApplicationController
  before_action :set_product_id , only: [:new, :index, :create]

  def index
    @reviews = @product.reviews.all
  end

  def new
    @review = @product.reviews.new(product_id: params[:product_id])
  end

  def create
    @review = Review.create(review_params)
    respond_to do |format|
    if @review.save
      format.html do
        redirect_to product_path(@product),
                    flash: {notice: "Review created, wait for submitting by admitistrator"}
      end
    else
      format.html  { render :new }
    end
      end
    end

  private

  def review_params
    params.require(:review).permit(:author, :product_id,
                                    :body, :rating, :email)
  end

  def set_product_id
    @product = Product.find(params[:product_id])
  end

end
