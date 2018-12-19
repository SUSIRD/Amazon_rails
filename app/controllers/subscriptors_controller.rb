  class SubscriptorsController < ApplicationController
    protect_from_forgery with: :null_session
    layout "signin"
    before_action :find_subscriptor, only: [ :show, :edit, :update, :destroy]

    def index
      @subscriptors = Subscriptor.all.order(created_at: :desc)
      respond_to do |format|
        format.html
        format.json { render json: @subscriptors }
      end
    end
    def new
      @subscriptor = Subscriptor.new
    end

    def create
      @subscriptor = Subscriptor.new(subscriptor_params)

        respond_to do |format|
          if @subscriptor.save

            UserNotifierMailer.send_subscribe_email(@subscriptor).deliver_now
            format.html { redirect_to posts_path, notice: "¡Te has suscrito exitosamente" }
            format.json { render :show, status: :created }
          else
            format.html { render :new, notice: "La suscripción falló en crearse, vuelva a intentarlo" }
            format.json { render json: @subscriptor.errors, status: :unprocessable_entity }        
            end
          end
      end

      def show
        respond_to do |format|
          format.html
          format.json { render json: @subscriptor }
        end
      end

      def edit

      end

    def update
      respond_to do |format|
        if @subscriptor.update(subscriptor_params)
          format.html { redirect_to subscriptors_path(@subscriptor) }
          format.json { render :show, status: :ok }
        else
          format.html { render :edit }
          format.json { render json: @subscriptor.errors, status: :unprocessable_entity }
        end 
      end

     
    end

    def destroy
      @subscriptor.destroy
      respond_to do |format|
        format.html { redirect_to subscriptors_path, notice: "Subscriptor was successfull destroyed" }
        format.json { head :no_content }
      end
      
    end

    private
      def find_subscriptor
        @subscriptor = Subscriptor.find(params[:id])
      end
      def subscriptor_params
      params.require(:subscriptor).permit(:name, :email)
      end
  end
