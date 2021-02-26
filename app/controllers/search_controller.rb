class SearchController < ApplicationController
  def index
    @nearest_station = SearchFacade.find_nearest_station(params[:location])
    @directions = SearchFacade.find_directions(params[:location], @nearest_station)
  end
end
