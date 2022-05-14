require 'rails_helper'

RSpec.describe 'Login', type: :feature do
  describe 'User' do
    before(:each) do
      @user = User.create(name: 'yaseer', password: '12345678', bio: 'I am yaseer anaisi okino',
                          email: 'yaseerokino@lk.com', confirmed_at: Time.now)
      @user2 = User.create(name: 'dave', password: '123456ve8', bio: 'I he hah a ',
                           email: 'dave@lk.com', confirmed_at: Time.now)
      visit new_user_session_path
      fill_in placeholder: 'Email', with: 'yaseerokino@lk.com'
      fill_in placeholder: 'Password', with: '12345678'
      click_button 'Log in'

      @post1 = Post.create(title: 'The mean one',
                           text: 'The tale of a mean one ',
                           comments_counter: 0, likes_counter: 0, user: @user)
      @post2 = Post.create(title: 'The crazy one',
                           text: 'This is the story of a crazy one',
                           comments_counter: 0,
                           likes_counter: 0, user: @user)
      @post3 = Post.create(title: 'the good one',
                           text: 'This is the third post',
                           comments_counter: 0,
                           likes_counter: 0, user: @user)

      @comment1 = Comment.create(text: 'A really mean book', user: User.first,
                                 post: Post.first)
      @comment2 = Comment.create(text: 'damn that was mean', user: User.first, post: Post.first)
      @comment3 = Comment.create(text: 'ha ha ha ha', user: User.first, post: Post.first)

      visit user_posts_path(@user.id)
    end

    it 'shows post title' do
      expect(page).to have_content('The crazy one')
      visit user_session_path
    end

    it 'shows number of comments' do
      post = Post.first
      expect(page).to have_content(post.comments_counter)
    end

    it 'shows number of likes' do
      post = Post.first
      expect(page).to have_content(post.likes_counter)
    end

    it "can see some of the post's body." do
      expect(page).to have_content 'This is the story of a crazy one'
    end

    it 'username of commenter is shown' do
      post = Post.first
      comment = post.comments.first
      expect(page).to have_content(comment.user.name)
    end

    it 'can see all comments of all commenters.' do
      expect(page).to have_content 'damn that was mean'
    end
  end
end
