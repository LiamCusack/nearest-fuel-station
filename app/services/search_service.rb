class SearchService
  def self.nrelconn
    @@nrelconn = Faraday.get("https://developer.nrel.gov/api") do |req|
      req.params['api_key'] = ENV["h0o9Xw8rbFvPLreCgDnvGL6lfXc4IxIzxKINO0e0"]
    end
  end

  def self.mapconn
    @@mapconn = Faraday.get("https://www.mapquestapi.com/directions/v2") do |req|
      req.params['key'] = ENV["02jAvp0vEqqqdEE6wOj0LSLfTPxNbusG"]
    end
  end

  def self.find_nearest_station(params)
    nearest_station = nrelconn.get("/alt-fuel-stations/v1/nearest.json?&location=#{params[:location]}&limit=1")
    json = json_parse(nearest_station)
    binding.pry
  end

  def self.find_directions(start, finish)
    directions = mapconn.get("/route?from=#{start}&to=#{finish}&outFormat=json&ambiguities=ignore&routeType=fastest&doReverseGeocode=false&enhancedNarrative=false&avoidTimedConditions=false")
    json = json_parse(directions)
  end

  def self.json_parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
