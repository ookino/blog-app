# class CreateJoinTableUsersPosts < ActiveRecord::Migration[7.0]
#  def change
#     create_join_table :users, :posts, column_options: { null: false }, table_name: :likes do |t|
#       t.index :user_id
#       t.index :post_id
#     end
#   end
# end
