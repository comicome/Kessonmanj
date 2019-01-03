namespace :restaurants do
  desc "Add longitude and latitude for all restaurants from their address"
  task geolocalisation: :environment do
    restaurants_without_geolocalisation = []
    restaurant_list = []
    Restaurant.all.each do |restaurant|
      results = Geocoder.search(restaurant.address)

      if results.first.nil?
        results = Geocoder.search("#{restaurant.name}, Paris")
        
        if results.first.nil?
          restaurant_without_geolocalisation = {
            "name" => restaurant.name,
            "address" => restaurant.address,
            "find_with" => "not_found"
          }
          restaurants_without_geolocalisation << restaurant_without_geolocalisation
        else
          restaurant_without_geolocalisation = {
            "name" => restaurant.name,
            "address" => restaurant.address,
            "find_with" => "name"
          }
          restaurants_without_geolocalisation << restaurant_without_geolocalisation
          latitude = results.first.coordinates[0]
          longitude = results.first.coordinates[1]
          restaurant.latitude = latitude
          restaurant.longitude = longitude

          results = Geocoder.search([latitude, longitude])
          restaurant_list << restaurant
          restaurant.save
        end
      else
        latitude = results.first.coordinates[0]
        longitude = results.first.coordinates[1]
        restaurant.latitude = latitude
        restaurant.longitude = longitude
        restaurant_list << restaurant
        restaurant.save
      end
    end
  end
end
