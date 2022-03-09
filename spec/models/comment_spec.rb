require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Comment model' do
    comment = Comment.new(text: 'test post 1', user_id: 1, post_id: 1)

    before(:each) { comment.save }

    it 'check if it increases the comments' do
      prev = Post.find(1).comments_counter
      comment.update_comment_counter
      expect(Post.find(1).comments_counter).to eq(prev + 1)
    end
  end
end
