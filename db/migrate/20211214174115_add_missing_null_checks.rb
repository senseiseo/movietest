class AddMissingNullChecks < ActiveRecord::Migration[6.1]
  def change
    change_column_null :movies, :title, false 
    change_column_null :movies, :body, false
    change_column_null :categories, :name, false
  end
end
