require 'rails_helper'

RSpec.describe 'Login', type: :feature do
  describe 'User' do
    before(:each) do
      @user = User.create(name: 'yaseer', password: '12345678', bio: 'I am yaseer anaisi okino',
                          email: 'yaseerokino@lk.com', confirmed_at: Time.now)
      @user2 = User.create(name: 'mensa', password: '123456ve8', bio: 'many men ',
                           email: 'mesa@lk.com', confirmed_at: Time.now)
      @user3 = User.create(name: 'hiha', password: '12345654773546ve8', bio: 'juju bubu juju ',
                           email: 'hiha@lk.com', confirmed_at: Time.now)
      @user4 = User.create(name: 'dave', password: '12348v45yv45', bio: 'the real trenshecs ',
                           email: 'okino@lk.com', confirmed_at: Time.now)
      visit new_user_session_path
      fill_in placeholder: 'Email', with: 'yaseerokino@lk.com'
      fill_in placeholder: 'Password', with: '12345678'
      click_button 'Log in'
      visit root_path
    end

    it 'shows the username of all users' do
      expect(page).to have_content('yaseer')
      expect(page).to have_content('dave')
      expect(page).to have_content('mensa')
      expect(page).to have_content('hiha')
    end

    it 'shows photo' do
      image = page.all('img')
      expect(image.size).to eql(4)
    end

    it 'shows number of posts for each user' do
      expect(page).to have_content('number of posts: 0')
    end

    it 'show users page when clicked' do
      expect(page).to have_content('number of posts: 0')
      click_on 'yaseer'
      expect(page).to have_current_path user_path(@user)
      expect(page).to have_no_content('dave')
    end
  end
end
