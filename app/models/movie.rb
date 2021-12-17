class Movie < ApplicationRecord
  belongs_to :user
  has_many :positions
  has_many :categories, through: :positions
  has_many :ratings

  STARS = [1,2,3,4,5,6,7,8,9,10]

  validates :title, presence: true, length: {minimum:2, maximum: 30}
  validates :body, presence: true, length: {minimum:25}
  validates :stars, inclusion: {
    in: STARS, 
    message: "Превышен порог от 1 до 10"
  }

end
