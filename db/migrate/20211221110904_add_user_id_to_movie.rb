class AddUserIdToMovie < ActiveRecord::Migration[6.1]
  def change
    opts = { null: false, foreign_key: true }
    opts = opts.merge({ default: User.first.id }) if User.all.any?
    add_reference :movies, :user,  **opts
  end
end
