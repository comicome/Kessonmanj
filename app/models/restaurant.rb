class Restaurant < ApplicationRecord
  geocoded_by :address
  has_many :comments, dependent: :destroy
  has_many :labels, dependent: :destroy
  acts_as_taggable
  before_create :set_geo_datas


  def self.search(search, price, cooking_style, user_id)
    restaurants = self
    if search
      restaurants = restaurants.where("restaurants.name LIKE ? OR address LIKE ?", "%#{search}%", "%#{search}%")
    end
    if price
      price = price.reject(&:blank?).join(" - ")
      restaurants = restaurants.where("price LIKE ?", "%#{price}%")
    end
    if cooking_style
      restaurants = restaurants.tagged_with(cooking_style, :any => true)
    end
    if user_id.present?
      restaurants = restaurants.joins(:labels).where("labels.user_id = ? AND labels.name = ?", user_id, "Honnête")
    end
    restaurants
  end

  def set_geo_datas
    results = Geocoder.search(self.address)
    latitude = results.first.coordinates[0]
    longitude = results.first.coordinates[1]
    self.latitude = latitude
    self.longitude = longitude
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
