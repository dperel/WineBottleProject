class History < ActiveRecord::Base

  def self.history_array
    @@history_array = []
  end

  def self.get_history(address) 
    chain_client = Chain::Client.new(key_id: '363d6e562d4c76b4f0ddc636934d71e3', key_secret: ENV['key_secret'])
    chain_client.block_chain = 'testnet3'

    transaction_data = chain_client.get_address_transactions(address)
    if transaction_data.length == 1
      prior_address = transaction_data[0]["inputs"][0]["addresses"][0] # this is a the source of the transaction
    else 
      prior_address = transaction_data[1]["inputs"][0]["addresses"][0]
    end

    if prior_address == "mgEZRfavVcZ3MHkYSwfQGD2S2eZWZ7wdsZ"# if the source == master faucet
      @@history_array << "WINE FAUCET"
    else
      @@history_array << prior_address
      address = prior_address
      get_history(address)
    end
  end

  def self.past_owners
    user_ids = []
    @users = []
    @@history_array.map{|address| user_ids << Address.where(btc_address: address).pluck(:user_id)}
    @users = user_ids.map { |user_id| User.find(user_id)}.flatten
  end 

  def self.past_locations
    #Need to get hash of location stringified location and their coords?
    @past_address_objects = []
    @@history_array.map{|address| @past_address_objects << Address.where(btc_address: address)
    @past_address_objects.flatten
   binding.pry
  end

end 
