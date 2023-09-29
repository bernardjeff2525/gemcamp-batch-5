class PostsController < ApplicationController
  # before_action :set_post, except: [:index, :new, :create]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    # start_date = '2023-09-28'
    # end_date = '2023-09-30'
    @posts = Post.all
    # @posts = @posts.where(title: 'My sidfdfxth post')
    # @posts = @posts.where(created_at: start_date..end_date)
    # @posts = @posts.order(created_at: :desc) # desc / asc
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = 'Post created successfully'
      redirect_to posts_path
    else
      flash.now[:alert] = 'Post create failed'
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    if @post.update(post_params)
      flash[:notice] = 'Post update successfully'
      redirect_to posts_path
    else
      flash.now[:alert] = 'Post failed to update'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    flash[:notice] = 'Post destroy successfully'
    redirect_to posts_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
