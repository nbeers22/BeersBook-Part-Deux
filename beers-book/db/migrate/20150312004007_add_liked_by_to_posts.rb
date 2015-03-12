class AddLikedByToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :liked_by, :string
  end
end
