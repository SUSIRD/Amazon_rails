class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :is_admin?

  

  def index
    @users = User.all.order(created_at: :desc)
    @posts = Post.all.order(created_at: :desc)
    @comments = Comment.all.count
    @subscriptors = Subscriptor.all.order(created_at: :desc)
  end

  def products
    @products = Product.all.order(created_at: :desc)
    
  end

  private
  def is_admin?
    unless current_user.admin?
      flash[:alert] ="You don't have permissions"
      redirect_to root_path
    end
  end

 
  

  
end
