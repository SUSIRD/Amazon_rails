class BlogController < ApplicationController
  def index
    render status: 200
  end

  def new
   #get
  end

  def create 
    #post
    if condition
      #si se cumple 
    else
      #si falla
      redirect_to blog_index_path
    end 
  end

  def edit 
    #get
  end

  def update 
    #post / put / patch
    if condition

      redirect_to home_about_path
    end
    
  end

  def delete 
    #post / delete / destroy
  end

  def show
    
  end

  
end
