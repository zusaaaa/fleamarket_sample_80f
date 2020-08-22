class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to product_path(@comment.product.id)
    else
      redirect_to root_path
    end
  end

  def new
    @comment = Comment.new
  end

  def destroy
    if Comment.find(params[:id]).destroy
      redirect_to root_path, notice: "コメントを削除しました"
    else
      redirect_to root_path
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, product_id: params[:product_id])
  end
end
