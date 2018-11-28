class Comment < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  validates :body, :user_id, :restaurant_id, presence: true
end
