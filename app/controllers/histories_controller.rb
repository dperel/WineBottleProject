class HistoriesController < ApplicationController

  def create 
    wine_story = History.where(address_id: params["address"]["address_id_for_history"])
    if wine_story.empty?
        redirect_to user_path(current_user)
        flash[:notice] = "You are the first owner of this bottle. There is no prior history to display."
    else 
        for_google = []
        mappable = wine_story[0].addresess_for_map.split(",")
        mappable.map{|ad| for_google << ad.gsub!(/[^0-9A-Za-z]/, '')}
        display = []
        for_google.map{|addr| display << Address.where(btc_address: addr)}
        @real_data = display.flatten
    end
  end
end # ends create


