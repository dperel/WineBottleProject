class Vineyard < ActiveRecord::Base

  has_many :addresses 

  attr_accessor :name 
  
  #The point of this model should be: 
  #1. Make vineyard accounts with Devise 

end
