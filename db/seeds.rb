require 'json'

Restaurant.destroy_all

file = File.read('db/listRestaurants.json')
data_hash = JSON.parse(file)

restaurants = Restaurant.create(data_hash)