class VineyardsController < ApplicationController
  def new 
    @vineyard = Vineyard.new
  end

  def create
    @vineyard = Vineyard.new(vineyard_params)
    if @vineyard.save 
      redirect_to @vineyard
    else 
      redirect_to '/vineyards/new'
    end
  end

  def show
    @vineyard = Vineyard.find(params[:id])
  end

  private

  def vineyard_params
    params.require(:staff).permit(:name, :email, :password, :password_confirmation, :is_vineyard)
  end

end 