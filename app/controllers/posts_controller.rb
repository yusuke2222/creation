class PostsController < ApplicationController
  before_action :authenticate_user, {only: [:new, :show, :create, :edit, :update, :destroy, :ensure_correct_user]}
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}

  def index
    @posts = Post.all.order("created_at DESC").page(params[:page]).per(8)
  end

  def new
    @post = Post.new
    @prefectures = Prefecture.all
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
    @likes_count = Like.where(post_id: @post.id).count
    @comments = @post.comments.includes(:user)
  end

  def create
    @post = Post.new(image: params[:image], text: params[:text], prefecture_id: params[:post][:prefecture_id], user_id: @current_user.id)
    if @post.save!
      flash[:notice] = "投稿を作成しました"
      redirect_to("/posts")
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
      redirect_to("/posts")
    else
      render("/posts/edit")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] ="投稿を削除しました"
    redirect_to("/posts")
  end

  def ensure_correct_user
    @post = Post.find_by(id: params[:id])
    if @post.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/posts")
    end
  end

  def about
  end

end
