class PostsController < ApplicationController
  def index
    @post = Post.all.order("created_at DESC")
  end

  def new
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def create
    @post = Post.new(image: params[:image], text: params[:text])
    @post.save
    redirect_to("/posts/index")
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.text = params[:text]
    @post.image = params[:image]
    if @post.save
      redirect_to("/posts/index")
    else
      render("/posts/edit")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    @post.save
    redirect_to("/post/index")
  end

end
