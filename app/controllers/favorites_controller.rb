class FavoritesController < ApplicationController
  before_action :set_product, only: [:create, :destroy]
  def favorite
    @product = Product.find(params[:id])
  end

  def create
    @favorite = current_user.favorites.create(product_id: params[:product_id])
    @favorites = Favorite.where(product_id: params[:product_id])
  end

  def destroy
    @favorite = current_user.favorites.find_by(product_id: @product.id)
    @favorite.destroy
    @favorites = Favorite.where(product_id: params[:product_id])
  end

  def set_product
    @product = Product.find(params[:product_id])
  end
end
