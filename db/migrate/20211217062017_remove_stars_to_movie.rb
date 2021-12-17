class RemoveStarsToMovie < ActiveRecord::Migration[6.1]
  def change
    remove_column :movies, :stars
  end
end
