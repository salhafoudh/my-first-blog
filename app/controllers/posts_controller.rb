class PostsController < ApplicationController
  before_action :set_post, except:[:new, :index, :create]
  before_action :authenticate_user!, except: [:index, :show]
  def index
    #@posts = Post.all.published
    @posts = user_signed_in? ? Post.sorted : Post.published.sorted
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
        render :new, status: :unprocessable_entity
    end
  end

  def edit
   
  end

  def update
    
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    
    @post.destroy
    redirect_to root_path
  end

  def show
    
  end

  private
    def post_params
      params.require(:post).permit(:title, :body, :published_at)
    end

    def set_post
      @post = user_signed_in? ? Post.find(params[:id]) : Post.published.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path
    end
  
end