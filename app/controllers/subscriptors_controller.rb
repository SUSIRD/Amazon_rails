class SubscriptorsController < ApplicationController
  layout "signin"
  def new
   
    @subscriptor = Subscriptor.new
    
  end

  def create
    @subscriptor = Subscriptor.new(subscriptor_params)
      if @subscriptor.save
        redirect_to posts_path, notice: "¡Te has suscrito exitosamente"
      else
      flash[:alert] = "La suscripción falló en crearse, vuelva a intentarlo"
      render :new
      end
  end

  private 
  def subscriptor_params
    params.require(:subscriptor).permit(:name, :email)
    
  end
  

end
