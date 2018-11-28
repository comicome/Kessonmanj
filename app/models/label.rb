class Label < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  validates :name, :user_id, :restaurant_id, presence: true 
  validates :name, inclusion: { in: %w(Hônnete Surcoté)}
end
