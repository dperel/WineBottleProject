class VerificationsController < ApplicationController

  def create
    address = params["address"]["sending_btc_address"]
    chain_client = Chain::Client.new(key_id: '0465c861f92619e87714a3f1b9bad5bb', 
                                     key_secret: ENV["key_secret"])
    chain_client.block_chain = 'testnet3'
    @response = chain_client.get_address(address)
    @address_balance = @response[0]["confirmed"]["balance"]
    @address_balance > 0 ? 
      @verification_status = 
        "Your transaction is recorded in the blockchain <br> <h1> Your bottle can be now sold to another user <h1>".html_safe
      : @verification_status = 
        "Your transaction has not been yet recorded in the blockchain"
  end 

end
