class Post < ApplicationRecord
  belongs_to :author, foreign_key: 'User'
  has_many :comments, foreign_key: 'post_id'
  has_many :likes, foreign_key: 'post_id'
end
