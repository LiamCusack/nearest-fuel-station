class SearchFacade
  def self.find_nearest_station(params)
    response = SearchService.find_nearest_station(params)
  end

  def self.find_directions(start, finish)
    response = SearchService.find_directions(start, finish)
  end
end
