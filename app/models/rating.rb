class Rating < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  STARS = (1..10).to_a 

  validates :stars, inclusion: {
    in: STARS, 
    message: "1 do 10"
  }
end
