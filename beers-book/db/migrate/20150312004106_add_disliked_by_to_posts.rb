class AddDislikedByToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :disliked_by, :string
  end
end
