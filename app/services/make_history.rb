class MakeHistory 

  attr_accessor :address_id, 
                :btc_address

  def initialize
    @address_id = Address.last.id
    @btc_address = Address.last.btc_address
  end

  def self.run
    wine_story = History.new
    wine_story.address_id = Address.last.id
    address = Address.last.btc_address
    History.history_array(address)
    History.make_history(address, wine_story) 
    wine_story.save
  end

end