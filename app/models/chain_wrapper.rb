class ChainWrapper

  attr_accessor :chain_client

  require 'bitcoin'
  require 'chain'

  def initialize(key_id, key_secret)
    @key_secret = key_secret
    @key_id = key_id
  end

  def self.set_chain_client_and_testnet
    @chain_client = Chain::Client.new(key_id: '363d6e562d4c76b4f0ddc636934d71e3', key_secret: ENV['key_secret'])
    @chain_client.block_chain = 'testnet3'
  end

end

