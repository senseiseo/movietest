class Rating < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  STARS = [1,2,3,4,5,6,7,8,9,10]

  validates :stars, inclusion: {
    in: STARS, 
    message: " 1 do 10"
  }


  def average_stars
    # все оценки юзерей к этому фильму нужно будет выводить 
    #self.users.average(:stars)
    Rating.average(:stars)
  end
end
