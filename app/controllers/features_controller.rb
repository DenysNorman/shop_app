class FeaturesController < ApplicationController
  def index
    @product = Product.find(params[:product_id])
    respond_to do |format|
      format.html
      format.js
    end
  end
end
