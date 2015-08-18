class ChainWrapper
  attr_reader :api_client

  def initialize
    unless @api_client
      @api_client = Chain::Client.new(key_id: '0465c861f92619e87714a3f1b9bad5bb', key_secret: ENV["key_secret"])
      @api_client.block_chain = 'testnet3'
      @api_client
    end
  end

end
