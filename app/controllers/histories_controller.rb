class HistoriesController < ApplicationController

  def create
    address = params["address"]["sending_btc_address"]
    History.history_array
    past_addresses = History.get_history(address).map{|address| Address.where(btc_address: address)}
    
    if !past_addresses.flatten.empty?
      @users = []
      past_addresses.each do |address|
        # binding.pry
        address.each do |address|
          @users << address.user
        end
      end
      # binding.pry
      @google_map_array = []
      past_addresses.each do |location|
        location.each do |loc|
          @google_map_array << {"lat" => loc.latitude, "lng" => loc.longitude}
        end
       end
      else
        render users_path(current_user)

      end
    end



    # binding.pry
end
   


