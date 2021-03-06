class Category < ApplicationRecord
  has_many :positions
  has_many :movies, through: :positions

  validates :name, presence: true, length: {minimum:2}

  scope :all_categories, -> {
    Category.all
  }
  
end
