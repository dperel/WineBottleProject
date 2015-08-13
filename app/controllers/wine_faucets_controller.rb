class WineFaucetsController < ApplicationController
    attr_accessor :bottle_group
  def new
    @address = Address.new
  end

  def show
  end
  
end
