class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :body
      t.belongs_to :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
