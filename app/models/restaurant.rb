class Restaurant < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :labels, dependent: :destroy
  acts_as_taggable
end
