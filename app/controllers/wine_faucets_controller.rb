class WineFaucetsController < ApplicationController
    attr_accessor :bottle_group
  #Goals of new route: 
  #1. Make new address with description from params
  #2. Persist in user's cellar
  #3. Grab btc from master bottle 
  def new
    @address = Address.new
  end

  def show
  end
  
end
