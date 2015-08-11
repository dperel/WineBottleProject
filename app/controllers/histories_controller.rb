class HistoriesController < ApplicationController

  def create
    address = params["address"]["sending_btc_address"]
    History.history_array
    past_addresses = History.get_history(address).map{|address| Address.where(btc_address: address)}
    if !past_addresses.flatten.empty?
      @addresses = []
      past_addresses.each do |address|
        address.each do |address|
        @addresses << address
      end
    end 
   end
   @addresses
  end # ends create

end # ends controller

