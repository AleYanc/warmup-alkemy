class ActAsParanoidInPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :deleted_at, :timestamp
  end
end
