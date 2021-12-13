class Movie < ApplicationRecord
  has_many :positions
  has_many :categories, through: :positions

  validates :title, presence: true, length: {minimum:2}
  validates :body, presence: true, length: {minimum:2}

  def created_at_formatted 
    created_at.strftime('%Y-%m-%d %H:%M:%S')
  end 
end
