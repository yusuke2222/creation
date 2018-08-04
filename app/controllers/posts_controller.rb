class PostsController < ApplicationController
  before_action :authenticate_user

  def index
    @post = Post.all.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
  end

  def create
    @post = Post.new(image: params[:image], text: params[:text], user_id: @current_user.id)
    if @post.save
      flash[:notice] = "投稿を作成しました"
      redirect_to("/posts/index")
    else
      render("/posts/new")
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.text = params[:text]
    @post.image = params[:image]
    if @post.save
      flash[:notice] = "投稿を編集しました"
      redirect_to("/posts/index")
    else
      render("/posts/edit")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] ="投稿を削除しました"
    redirect_to("/posts/index")
  end

end
