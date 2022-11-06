require 'rails_helper'

RSpec.describe 'Picture', type: :feature do
  describe 'index' do
    before :each do
      visit user_session_path
      @user = User.create(name: 'Roland', email: 'roland@gmail.com', password: '123456',
                          password_confirmation: '123456')
      within('form') do
        fill_in 'Email', with: 'roland@gmail.com'
        fill_in 'Password', with: '123456'
      end
      click_button 'Log in'
    end

    it 'expect page after sign in to be pictures path' do
      expect(page).to have_current_path root_path
    end

    it 'pictures page shows the right content' do
      expect(page).to have_content('Welcome to Ngeni GalleryApp')
    end
    it 'pictures page shows the right content' do
      expect(page).to have_content('Sign out')
    end

    it 'pictures page shows the right content' do
      expect(page).to have_content('Upload picture')
    end
  end
end
