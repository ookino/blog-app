class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, :likes_counter, numericality: { greater_than_or_equal_to: 0 }
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'

  def update_post_counter
    user.increment!(:posts_counter)
  end

  def recent_5_comments
    comments.order('created_at Desc').limit(5)
  end
end
