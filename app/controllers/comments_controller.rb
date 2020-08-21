class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    redirect_to "/products/#{@comment.product.id}"
  end

  def new
    @comment = Comment.new
  end

  def destroy
    Comment.find_by(id: params[:id],product_id: params[:product_id]).destroy
    redirect_to root_path
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, product_id: params[:product_id])
  end
end
