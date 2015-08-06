class HistoriesController < ApplicationController

  def create
    address = params["address"]["sending_btc_address"]
    History.get_history(address) 

  end

end