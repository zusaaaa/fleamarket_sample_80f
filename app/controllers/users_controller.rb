class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @product = Product.where("user_id = ? and status = ?", current_user.id, "出品中" )
  end
end
