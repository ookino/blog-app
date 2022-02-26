class UpdateUserIdColumnLikes < ActiveRecord::Migration[7.0]
  def change
    remove_index :likes, :post_id
  end
end
