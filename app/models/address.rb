class Address < ActiveRecord::Base
  belongs_to :user
  belongs_to :vineyard 
  
# The point of this model should be: 
# 1. Create a BTC address (bottle holder) and link it to a bottle serial number
# 2. Check the balance of any BTC address (bottle holder) to see if it contains the bottle 
# 3. 

end
