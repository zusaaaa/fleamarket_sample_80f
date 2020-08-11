class ProductsController < ApplicationController

  # def index
  #   @products = Product.all
  # end

  # def show
  #   @images = Image.all
  #   @images = Image.find(params[:id])
  # end

  def new
    @product = Product.new
    @product.images.build
  end

  def create
    @product = Product.create(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:product_name, :product_explanation, :brand, :product_status_id, :shipping_method_id, :shipping_charge_id, :prefecture_id, :days_until_shipping_id, :price, :status, images_attributes: [:src])
  end
end
