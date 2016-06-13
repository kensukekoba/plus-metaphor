class AddLikesCountToMetaphors < ActiveRecord::Migration
  def change
    add_column :metaphors, :likes_count, :integer, default: 0
  end
end
