class Category < ApplicationRecord
  has_many :positions
  has_many :movies, through: :positions

  validates :name, presence: true, length: {minimum:2}

  def created_at_formatted 
    created_at.strftime('%Y-%m-%d %H:%M:%S')
  end 
end
