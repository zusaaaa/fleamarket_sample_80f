class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @images = Image.all
    @images = Image.find(params[:id])
  end

end
