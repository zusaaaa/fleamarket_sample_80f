class ItemsController < ApplicationController
  
  def index
    @product = Product.new
  end

  def create
  end

  def show
    @product = Product.find(params[:id])
  end
end
