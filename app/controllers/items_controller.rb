class ItemsController < ApplicationController
  
  def index
    @products = Product.all
    # @imagess = Image.includes(:product).order("created_at DESC")
    @images = Image.all
    # @image = Image.find(params[:id])
  end

end