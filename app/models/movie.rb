class Movie < ApplicationRecord
  # belongs_to :user
  has_many :positions
  has_many :categories, through: :positions
  has_many :ratings


  validates :title, presence: true, length: {minimum:2, maximum: 30}
  validates :body, presence: true, length: {minimum:25}

end
