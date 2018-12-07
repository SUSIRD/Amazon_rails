class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  # before_action :validate_user, only: [:edit, :update, :destroy]
  before_action :is_admin?, only: [:edit, :update, :destroy]

  def index
    if params[:category].blank?
      @posts = Post.all.order(created_at: :desc).paginate(page: params[:page], per_page: 2)

      @last_post = Post.last
      @shoes_category = Category.find_by(name: "Shoes")
      @shoes_last_post = @shoes_category.posts.last

      @woman_category = Category.find_by(name: "Woman")
      @woman_last_post = @woman_category.posts.last
    else
      @category_id = Category.find_by(name: params[:category]).id
      @posts = Post.where(category_id: @category_id).order(created_at: :desc).paginate(page: params[:page], per_page: 2)
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.order(created_at: :desc).paginate(page: params[:page], per_page: 2)
  end

  def new
    @post = Post.new 
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save 
      #send email to users with new post link

      title = @post.title
      id = @post.id
      users = User.where(role: "user")
      subscriptors = Subscriptor.all
      

      users.each do |user|
        email = user.email
        type_user = "User"
         UserNotifierMailer.new_post_notifying(email, title, id, type_user).deliver_now
      end
      
      subscriptors.each do |subscriptor|
       email = subscriptor.email
       type_user = "Subscriptor"
        UserNotifierMailer.new_post_notifying(email, title, id, type_user).deliver_now
      end
      redirect_to posts_path, notice: "¡El post fue creado exitosamente"
    else 
      flash[:alert] = "El post falló en crearse, vuelva a ingresarlo"
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)

      title = @post.title
      id = @post.id
      users = User.where(role: "user")
      subscriptors = Subscriptor.all
             
      
      users.each do |user|
        email = user.email
        type_user = "User"
         UserNotifierMailer.edit_post_notifying(email, title, id, type_user).deliver_now
      end

      subscriptors.each do |subscriptor|
        email = subscriptor.email
        type_user = "Subscriptor"
         UserNotifierMailer.edit_post_notifying(email, title, id, type_user).deliver_now
       end
      redirect_to posts_path, notice: "¡El post fue actualizado exitosamente!"
    else
      flash[:alert] = "El post falló en registrarse, vuelva a ingresarlo"
      render :edit
    end
  end
  
  def destroy
    post = Post.find(params[:id])
    post.destroy

    # flash[:notice] = "El post fue eliminado exitosamente!"
    redirect_to posts_path, notice: "¡El post fue eliminado exitosamente!"
  end

  private
  def post_params
    params.require(:post).permit(:user_id, :title, :content, :category_id)
  end

  # def validate_user
  #   unless current_user.posts.ids.to_s.include? params[:id]
  #     redirect_to  root_path
  #     flash[:alert] = "You don't haver permissions"
  #   end
  # end
  def is_admin?
    unless current_user.admin?    
      flash[:alert] ="You don't have permissions"
      redirect_to root_path
    end
  end

end
