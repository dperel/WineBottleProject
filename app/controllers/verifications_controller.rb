class VerificationsController < ApplicationController

  def create
    address = params["address"]["sending_btc_address"]
    chain_client = Chain::Client.new(key_id: '363d6e562d4c76b4f0ddc636934d71e3', key_secret: ENV['key_secret'])
    chain_client.block_chain = 'testnet3'
    @response = chain_client.get_address(address)
    @response[0]["confirmed"]["balance"] > 0 ? @verification_status = "verified" : @verification_status = "UNVERIFIED"
  end 

end
