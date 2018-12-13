class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
  end
  
  private
  def product_params
    params.require(:product).permit(:name, :price, :acive)
    
  end
  
end


