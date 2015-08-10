class HistoriesController < ApplicationController
geocoded_by :address
after_validation :geocode

  def create
    address = params["address"]["sending_btc_address"]
    History.history_array
    History.get_history(address)
    @users = History.past_owners
    binding.pry 
    @addresses = Address.
    @hash = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.latitude ##Need to get lat and long 
      marker.lng user.longitude
    end 
    
  end

end