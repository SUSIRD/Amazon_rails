class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new 
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save 
      redirect_to root_path
    else 
      render :new
    end
  end

  def edit
  end

  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:user_id, :title, :content)
  end

end
