class ChainWrapper

  attr_accessor :chain_client

  require 'bitcoin'
  require 'chain'

  def initialize(key_id, key_secret)
    @key_secret = key_secret
    @key_id = key_id
  end

  def self.set_chain_client_and_testnet
    @chain_client = Chain::Client.new(key_id: '0465c861f92619e87714a3f1b9bad5bb', key_secret: ENV["key_secret"])
    @chain_client.block_chain = 'testnet3'
  end

end

