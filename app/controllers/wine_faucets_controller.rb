class WineFaucetsController < ApplicationController
  def new
    @address = Address.new
  end
end
