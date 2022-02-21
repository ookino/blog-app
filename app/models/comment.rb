class Comment < ApplicationRecord
  belongs_to :author, foreign_key: 'User'
  belongs_to :post, foreign_key: 'post_id'
end
