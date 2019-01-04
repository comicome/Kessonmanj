class Restaurant < ApplicationRecord
  geocoded_by :address
  has_many :comments, dependent: :destroy
  has_many :labels, dependent: :destroy
  acts_as_taggable

  def self.search(search, price, cooking_style)
    restaurants = self
    if search
      restaurants = restaurants.where("name LIKE ? OR address LIKE ?", "%#{search}%", "%#{search}%")
    end
    if price
      price = price.reject(&:blank?).join(" - ")
      restaurants = restaurants.where("price LIKE ?", "%#{price}%")
    end
    if cooking_style
      restaurants = restaurants.tagged_with(cooking_style, :any => true)
    end
    restaurants
  end

  def self.to_geojson
    restaurants_geojson = []
    all.each do |restaurant|
      restaurant_geojson = { 
        :type => "Feature", 
        :geometry => {
          :type => "Point", 
          :coordinates => [
            restaurant.longitude,
            restaurant.latitude
          ]
        },
        :properties => {
          :title => restaurant.name,
          :id => restaurant.id
        }
      }
      restaurants_geojson << restaurant_geojson
    end
    restaurants_geojson.to_json
  end
end
