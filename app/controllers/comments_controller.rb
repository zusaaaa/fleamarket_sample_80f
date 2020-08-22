class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to product_path(@comment.product.id)
    else
      redirect_to root_path
    end
  end

  def destroy
    product = Product.find(params[:id]) #追記
    if Comment.find(params[:id]).destroy
      redirect_to product_path(product), notice: "コメントを削除しました"
    else
      redirect_to root_path
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, product_id: params[:product_id])
  end
end
