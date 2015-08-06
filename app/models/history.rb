class History < ActiveRecord::Base

  @@history_array = []
  def self.get_history(address) 
    chain_client = Chain::Client.new(key_id: '363d6e562d4c76b4f0ddc636934d71e3', key_secret: ENV['key_secret'])
    chain_client.block_chain = 'testnet3'
    transaction_data = chain_client.get_address_transactions(address)
    prior_address = transaction_data[0]["inputs"][0]["addresses"][0]

    if prior_address == "mgEZRfavVcZ3MHkYSwfQGD2S2eZWZ7wdsZ" || @@history_array.length > 5
      @@history_array
    else
      @@history_array << prior_address
      get_history(prior_address)
    end
    @@history_array
    binding.pry
  end
    # mgEZRfavVcZ3MHkYSwfQGD2S2eZWZ7wdsZ
    # until transaction_data[:addresses][:sender] == master_address do ....


end
