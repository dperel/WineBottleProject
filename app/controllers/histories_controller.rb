class HistoriesController < ApplicationController

  def create
    address = params["address"]["sending_btc_address"]
    History.history_array
    History.get_history(address)
    @users = History.past_owners  
  end


  @users = History.past_owners
  @hash = Gmaps4rails.build_markers(@users) do |user, marker|
    marker.lat user.latitude
    marker.lng user.longitude
  end

end