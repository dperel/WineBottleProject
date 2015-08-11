class HistoriesController < ApplicationController

  def create
    address = params["address"]["sending_btc_address"]
    History.history_array(address)
    past_addresses = History.get_history(address).map{|address| Address.where(btc_address: address)}
    @addresses = []
    past_addresses.each do |address|
      address.each do |address|
        @addresses << address
      end # ends inner do
    end # ends outer do
    @addresses
  end # ends create

end # ends controller
