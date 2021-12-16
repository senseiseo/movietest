class Movie < ApplicationRecord
  has_many :positions
  has_many :categories, through: :positions

  STARS = [1,2,3,4,5,6,7,8,9,10]

  validates :title, presence: true, length: {minimum:2, maximum: 30}
  validates :body, presence: true, length: {minimum:25}
  validates :stars, inclusion: {
    in: STARS, 
    message: "Превышен порог от 1 до 10"
  }

  def average_stars
    # все оценки юзерей к этому фильму нужно будет выводить 
    #self.users.average(:stars)
    Movie.average(:stars)
  end
end
