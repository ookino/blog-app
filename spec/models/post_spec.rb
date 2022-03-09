require 'rails_helper'

RSpec.describe Post, type: :model do
  user = User.new(name: 'Yaseer Okino', bio: 'I am a designer and developer', posts_counter: 0, photo: 'https://images.unsplash.com/photo-1645701180165-92df752b4cf4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2787&q=80')
  post = Post.new(title: 'Post 1', text: 'Text...', comments_counter: 0, likes_counter: 0, user_id: user.id)

  before(:each) { post.save }

  it 'validates post title' do
    post.title = nil
    expect(post).to_not be_valid
  end

  it 'validates post text' do
    post.text = nil
    expect(post).to_not be_valid
  end

  it 'validates post comments_counter' do
    post.comments_counter = nil
    expect(post).to_not be_valid
  end

  it 'validates the numericality of the comments_counter' do
    post.comments_counter = 'this hould be a post'
    expect(post).to_not be_valid
  end

  it 'validates the post likes_counter' do
    post.likes_counter = nil
    expect(post).to_not be_valid
  end

  it 'validates the numericality of the likes_counter' do
    post.likes_counter = '1'
    expect(post).to_not be_valid
  end

  it 'validates the post user_id' do
    post.user_id = nil
    expect(post).to_not be_valid
  end

  describe '#recent_comments' do
    before(:each) { 5.times { |i| Comment.new(text: "Comment #{i}", post_id: post.id) } }

    it 'returns last 5 comments' do
      expect(user.recent_3_posts.length).to eq(3)
    end
  end
end
