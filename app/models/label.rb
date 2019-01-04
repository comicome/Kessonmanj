class Label < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  validates :name, :user_id, :restaurant_id, presence: true 
  validates :name, inclusion: { in: %w(Honnête Surcoté)}

  validate :one_label_per_user_per_restaurant
  
  scope :overated, -> { where name: "Surcoté" }
  scope :honest, -> { where name: "Honnête" }

  def one_label_per_user_per_restaurant
    if Label.where(user_id: user_id, restaurant_id: restaurant_id).any? 
      errors.add(:label, "Vous ne pouvez pas ajouter 2 labels pour le même restaurant")
    end
    true
  end

end
