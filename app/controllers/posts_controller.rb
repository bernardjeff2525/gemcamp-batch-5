class PostsController < ApplicationController
  require 'csv'
  before_action :authenticate_user!, except: [:index, :show]
  # before_action :set_post, except: [:index, :new, :create]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :validate_post_owner, only: [:edit, :update, :destroy]

  def index
    @posts = Post.includes(:categories, :user, :comments).all
    @posts = @posts.where('title LIKE ?', "%#{params[:title]}%")
    if params[:start_date].present? && params[:end_date].present?
      @posts = @posts.where(created_at: params[:start_date]..params[:end_date])
    end

    @posts = @posts.order(created_at: :desc)
                   .page(params[:page])
                   .per(5)

    respond_to do |format|
      format.html
      format.xml do
        render xml: @posts.as_json
      end
      format.csv do
        csv_string = CSV.generate do |csv|
          csv << ['email', 'comments_count', 'id', 'title', 'content', 'categories', 'created_at']

          @posts.each do |post|
            csv << [post.user&.email, post.comments_count, post.id, post.title, post.content,
                    post.categories.pluck(:name).join(','), post.created_at]
          end
        end
        render plain: csv_string
      end
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
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
    params.require(:post).permit(:title, :content, category_ids: [])
  end

  def validate_post_owner
    return if @post.user == current_user

    flash[:notice] = 'This post does not belongs to you'
    redirect_to posts_path
  end
end
