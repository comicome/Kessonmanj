class Restaurant < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :labels, dependent: :destroy
end
