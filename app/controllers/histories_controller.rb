class HistoriesController < ApplicationController

  def create
    address = params["address"]["sending_btc_address"]
    History.history_array
    History.get_history(address)
    @users = History.past_owners
    
  end

end