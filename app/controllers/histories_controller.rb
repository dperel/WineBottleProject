class HistoriesController < ApplicationController

  def create
    address = params["address"]["sending_btc_address"]
    History.history_array
    History.get_history(address)
    @users = History.past_owners
  
    @past_address_objects = History.past_locations
   
    @hash = Gmaps4rails.build_markers(@past_address_objects) do | marker|
      marker.lat address.latitude ##Need to get lat and long 
      marker.lng address.longitude
    end 
    
  end

end