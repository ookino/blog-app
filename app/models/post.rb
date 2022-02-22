class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  def update_post_counter
    user.increment!(:posts_counter)
  end

  def recent_5_comments
    comments.order('created_at Desc').limit(5)
  end
end
