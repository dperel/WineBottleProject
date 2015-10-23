# TheWineProject

http://winestem.herokuapp.com/

30 BILLION bottles of wine are sold - every year. Stem uses blockchain technology to securely verify and track track luxury goods.

Stem solves the trust problem between buyers and sellers, creating a durable and immutable record of sales and manufacturing history while keeping your identity private.

Helping sellers protect their brands - and buyers protect their tastes.

= = =

Distributed: no one can tamper with the records.
Powerful and scalable: Whether you're a consumer, collector, or distributor, it captures everything about the provenance and history of your items.
Privacy-friendly: your identity is never shared

= = =

Instructions:

Register as a regular user (wine distributor, merchant, auction house or a collector) or as a vineyard / winemaker. We will want your name, contact information and where you are based, but we will never share your information with others.

If your are making an account for a vineyard, you are able to create new wine bottles and enter them into the system. Each bottle will be issued with a unique identifier which serves dual purpose: it becomes a permanent part of blockchain, which can be never altered, and it can be used to tag the bottle to ensure that the physical product matches its digital identity. 

Your bottles are displayed in your cellar; you can also see records of the bottles you have once owned but either sold or withdrew for the system after consuming them. For your current wine collection, you can view a map charting your bottles' journeys from owner to owner, based on the geographic information from the profiles of prior owners. 

Your privacy is paramount to us.  Buyers of wine bottles are able to track the prior locations of their bottles, back to its vineyard of origin, but they are unable to see the personal information of its previous owners. 

Bitcoin's blockchain technology prevents fraudulent sales of unauthentic or stolen wine bottles. Before you commit to purchasing a bottle of wine, or before someone else commits to purchasing a bottle from you, the bottle's unique identifier can be located in the blockchain, allowing both parties to confirm the seller's rightful ownership of that bottle. Our software tools also allow you to trace the bottle back to its vineyard of origin, confirming its authenticity. 

= = =

Features:

* chain.co gem ('chain') to implement blockchain technology 
* testnet2 instead of real bitcoin network (gem 'bitcoin'), athough this app is fully compatible with the latter. 
* Each new wine bottle is generated with its bitcoin key and is immediately added to the blockchain
* AWS to store wine labels in .jpg format with paperclip gem
* Google Maps API (gmaps4rails, javascript) to chart wine bottle history with gem geocoder that maps location from user's city, state, and country input
* Devise for authentication (scope is managed through params, not roles)
* Bootstrap for front end
* Deployed to Heroku
