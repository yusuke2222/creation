class CommentsController < ApplicationController
  def create
    @comment = Comment.create(text: comment_params[:text], post_id: comment_params[:post_id], user_id: @current_user.id)
    redirect_to("/posts/#{@comment.post_id}")
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @comment.destroy
    flash[:notice] ="コメントを削除しました"
    redirect_to("/posts/#{@comment.post_id}")
  end

  private
  def comment_params
    params.permit(:text, :post_id)
  end
end
