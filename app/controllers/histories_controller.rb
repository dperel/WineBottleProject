class HistoriesController < ApplicationController

  def create
    address = params["address"]["sending_btc_address"]
    History.history_array
    @history = History.get_history(address) 
    @history
  end

end