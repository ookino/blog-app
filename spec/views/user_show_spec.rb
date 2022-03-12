require 'rails_helper'
​
RSpec.describe 'Login', type: :feature do
  describe 'User' do
    before(:each) do
      @user = User.create(name: 'yaseer', password: '12345678', bio: 'I am yaseer anaisi okino',
                          email: 'yaseerokino@lk.com', confirmed_at: Time.now)
      visit new_user_session_path
      fill_in placeholder: 'Email', with: 'yaseerokino@lk.com'
      fill_in placeholder: 'Password', with: '12345678'
      click_button 'Log in'
​
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
​
      visit user_path(@user.id)
    end
​
    it 'shows photo' do
      image = page.all('img')
      expect(image.size).to eql(1)
    end
​
    it 'shows the username' do
      expect(page).to have_content('yaseer')
    end
​
    it 'shows number of posts for each user' do
      user = User.first
      expect(page).to have_content(user.posts_counter)
    end
​
    it 'shows the users bio' do
      expect(page).to have_content('I am yaseer anaisi okino')
      visit user_session_path
    end
​
    it "Should see the user's first 3 posts" do
      expect(page).to have_content 'The mean one'
      expect(page).to have_content 'The crazy one'
      expect(page).to have_content 'the good one'
    end
​
    it 'see all post button exists' do
      expect(page).to have_content('See all posts')
    end
​
    it 'redirects to posts index page after clicking on see all posts' do
      click_link 'See all posts'
      expect(page).to have_current_path user_posts_path(@user)
    end
  end
end