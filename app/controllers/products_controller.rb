class ProductsController < ApplicationController
  before_action :set_product, only: [:index, :edit, :update, :show, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @products = Product.all
    @images = Image.all
    @q = Product.ransack(params[:q])
    @products =@q.result(distinct: true)
  end

  def show
    @product = Product.find(params[:id])
    @child_category = @product.category.parent
  end

  def new
    @product = Product.new
    @product.images.build
    @images = @product.images.build

    @category_parent = Category.where(ancestry: nil)
  end

  def create
    @product = Product.create(product_params)
    if @product.save
      redirect_to product_path(@product), notice: "#{@product.product_name}を出品しました"
    else
      @category_parent = Category.where(ancestry: nil)
      render :new
    end
  end

  def get_category_children
    @category_children = Category.find_by(id: params[:parent_id].to_s, ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find(params[:child_id].to_s).children
  end

  def edit
    @images = @product.images
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product), notice: "#{@product.product_name}を更新しました"
    else
      render :edit
    end
  end

  def destroy
      render :delete unless @product.user_id == current_user.id && @product.destroy
      redirect_to root_path, notice: "#{@product.product_name}を削除しました"
  end

  def search
    @products = Product.search(params[:keyword])
    @q = Product.search(search_params)
    @products = @q.result(distinct: true)
  end

  private

  def product_params
    params.require(:product).permit(:product_name, :product_explanation, :brand, :product_status_id, :shipping_method_id, :shipping_charge_id, :prefecture_id, :days_until_shipping_id, :price, :status, :category_id, images_attributes: [:src, :src_cache, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def search_params
    params.require(:q).permit!
  end
end
