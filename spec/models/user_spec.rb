require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.find(1)

  before(:each) { user.save }

  it 'validates post name' do
    user.name = nil
    expect(user).to_not be_valid
  end

  it 'validates the presence of the posts_counter' do
    user.posts_counter = nil
    expect(user).to_not be_valid
  end

  it 'validates the numericality of the posts_counter' do
    user.posts_counter = 'a'
    expect(user).to_not be_valid
  end

  it 'validates the presence of the bio' do
    user.bio = nil
    expect(user).to_not be_valid
  end

  it 'validates the user photo' do
    user.photo = nil
    expect(user).to_not be_valid
  end

  describe '#recent_3_posts' do
    before(:each) do
      3.times do |i|
        Post.new(title: "Post #{i}", text: "text#{i}", comments_counter: 0, likes_counter: 0, user_id: user.id)
      end
    end

    it 'returns the last 3 posts' do
      expect(user.recent_3_posts.length).to eq(3)
    end
  end
end
