class ProductsController < ApplicationController
  
  def new
    @product = Product.new
    @product.images.build
  end

  def create
    @product = Product.create(product_params)

  end

  private
  def product_params
    params.require(:product).permit(:product_name, :product_explanation, :brand, :product_status, :shipping_method, :shipping_charge, :shipping_area, :days_until_shipiing, :price, images_attributes: [:src])
  end
end
