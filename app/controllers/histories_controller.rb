class HistoriesController < ApplicationController

  def create 

    wine_story = History.where(address_id: params["address"]["address_id_for_history"])
    for_google = []
    mappable = wine_story[0].addresess_for_map.split(",")
    mappable.map{|ad| for_google << ad.gsub!(/[^0-9A-Za-z]/, '')}
    display = []
    for_google.map{|addr| display << Address.where(btc_address: addr)}
    @real_data = display.flatten
    binding.pry
    # @addresses = History.find(params["address"]["address_id_for_history"]).addresses_for_map 
  end
    # #Needs to be triggered after a transaction 
    # history = History.new
    # address = params["address"]["sending_btc_address"]
    # history.address_id = params["address"]["address_id_for_history"]
    # History.history_array(address)
    # History.make_history(address) 
    # history.save
    # redirect_to users_path(current_user)
  end # ends create


