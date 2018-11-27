require 'json'

Restaurant.destroy_all

file = File.read('listRestaurants.json')
data_hash = JSON.parse(file)

restaurants = Restaurant.create(data_hash)