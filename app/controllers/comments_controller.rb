class CommentsController < ApplicationController
  def create
    @comment = Comment.create(text: params[:text], post_id: params[:post_id], user_id: @current_user.id)
    redirect_to("/posts/#{@comment.post_id}")
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @comment.destroy
    flash[:notice] ="コメントを削除しました"
    redirect_to("/posts/#{@comment.post_id}")
  end
end
