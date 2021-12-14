class AddStarsToMovie < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :stars, :integer
  end
end
