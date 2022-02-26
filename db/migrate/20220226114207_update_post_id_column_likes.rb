class UpdatePostIdColumnLikes < ActiveRecord::Migration[7.0]
  def change
    remove_index :likes, :user_id
  end
end
