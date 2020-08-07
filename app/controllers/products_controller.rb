class ProductsController < ApplicationController
  
  def new
    @product = Product.new
    @product.images.build
  end

  def create
    @product = Product.create(product_params)
    if @product.save
      redirect_to @product
    else
      render :new
    end

  end

  private
  def product_params
    params.require(:product).permit(:product_name, :product_explanation, :brand, :product_status_id, :shipping_method_id, :shipping_charge_id, :prefecture_id, :days_until_shipping_id, :price, images_attributes: [:src])
  end
end
