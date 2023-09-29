class PostsController < ApplicationController
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
    @post = Post.new(params.require(:post).permit(:title, :content))
    if @post.save
      flash[:notice] = 'Post created successfully'
      redirect_to posts_path
    else
      flash.now[:alert] = 'Post create failed'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(params.require(:post).permit(:title, :content))
      flash[:notice] = 'Post update successfully'
      redirect_to posts_path
    else
      flash.now[:alert] = 'Post failed to update'
      render :edit, status: :unprocessable_entity
    end
  end

end
