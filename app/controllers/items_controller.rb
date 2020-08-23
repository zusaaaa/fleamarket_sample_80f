class ItemsController < ApplicationController
  def index
    @products = Product.includes(:user).order("created_at DESC")
  end
  
  # def new
  #   @product = Product.new
  #   @product.images.build
  # end

  # def create
  #   @product = Product.new(product_params)
  #   if @product.save
  #     redirect_to root_path
  #   else
  #     render :new
  #   end
  # end

  def show
    @product = Product.find(params[:product_id])
  end
  
  # private

  # def product_params
  #   params.require(:product).permit(:product_name, :product_explanation, :brand, :product_status_id, :shipping_method_id, :shipping_charge_id, :prefecture_id, :days_until_shipping_id, :price, :status, :user_id, images_attributes: [:src])
  #   merge(exhibitor_id: current_user.id)
  # end
end
