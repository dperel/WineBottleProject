class ChainWrapper
  attr_reader :api_client

  def initialize
    unless @api_client
      @api_client = Chain::Client.new(key_id: 'a9c71386c1e7d619906f66c1ad13f01d', key_secret: ENV["key_secret"])
      @api_client.block_chain = 'testnet3'
      @api_client
    end
  end

end
