class ItemsController < ApplicationController
  def index
    @products = Product.includes(:user).order("created_at DESC")
  end
  
  def show
    @product = Product.find(params[:product_id])
  end
end
