# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).


User.create([:name => 'Sarah', :email => 'sarah@sarah.com', :password => ENV[sarahs_fake_password], :password_confirmation => ENV[sarahs_fake_password], :is_vineyard => 1, :city => 'Brooklyn', :state => 'New York', :country => 'USA'])
User.create([:name => 'David', :email => 'david@david.com', :password => ENV[davids_fake_password], :password_confirmation => ENV[davids_fake_password], :is_vineyard => 1])
User.create([:name => 'Anna', :email => 'anna@anna.com', :password => ENV[annas_fake_password], :password_confirmation => ENV[annas_fake_password], :is_vineyard => 0])
User.create([:name => 'John Smith', :email => 'john@smith.com', :password => ENV[johns_fake_password], :password_confirmation => ENV[johns_fake_password], :is_vineyard => 0, :city => 'Moscow', :country => 'Russia'])
