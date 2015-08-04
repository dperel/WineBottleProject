class AddressesController < ApplicationController
  def new 
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    if @address.save 
      redirect_to @address
    else 
      redirect_to '/addresses/new'
    end
  end

  def show
    @address = Address.find(params[:id])
  end


  private

  def address_params
    params.require(:address).permit(:btc_address)
  end

end
