class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  # def show
  #   @images = Image.all
  #   @images = Image.find(params[:id])
  # end
  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
    @product.images.build

    @category_parent = []
    Category.where(ancestry: nil).each do |parent|
      @category_parent << parent
    end
  end
  
  def create
    @product = Product.create(product_params)
    if @product.save
      redirect_to root_path
    else
      @category_parent = []
      Category.where(ancestry: nil).each do |parent|
        @category_parent << parent
      end
      render :new
    end
  end

  def get_category_children # 子カテゴリーの取得
    @category_children = Category.find_by(id: "#{params[:parent_id]}", ancestry: nil).children
  end
  
  def get_category_grandchildren # 孫カテゴリーの取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  private

  def product_params
    params.require(:product).permit(:product_name, :product_explanation, :brand, :product_status_id, :shipping_method_id,
    :shipping_charge_id, :prefecture_id, :days_until_shipping_id, :price, :status, :category_id, images_attributes: [:src])
  end
end