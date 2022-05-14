require 'rails_helper'

RSpec.describe 'Login', type: :feature do
  describe 'login' do
    before(:each) do
      User.create(name: 'yaseer', password: '12345678', bio: 'I am yaseer okino', email: 'yaseer@ookino.com',
                  confirmed_at: Time.now)
    end
    it 'shows the right content' do
      visit new_user_session_path
      expect(page).to have_content('Sign In')
    end

    it 'Fill email and password inputs' do
      visit new_user_session_path
      fill_in placeholder: 'Email', with: 'yaseerok@ino.com'
      fill_in placeholder: 'Password', with: '123456'
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password')
    end

    it 'Without fill email and password inputs' do
      visit new_user_session_path
      fill_in placeholder: 'Email', with: ''
      fill_in placeholder: 'Password', with: ''
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password.')
    end

    it 'Fill email and password inputs' do
      visit new_user_session_path
      fill_in placeholder: 'Email', with: 'yaseer@ookino.com'
      fill_in placeholder: 'Password', with: '12345678'
      click_button 'Log in'
      expect(page).to have_content('Signed in successfully')
      expect(page).to have_current_path root_path
    end
  end
end
