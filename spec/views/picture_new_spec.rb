require 'rails_helper'

RSpec.feature 'Pictures', type: :feature do
  before(:each) do
    visit user_session_path
    @user = User.create(name: 'Roland', email: 'roland@gmail.com', password: '123456', password_confirmation: '123456')
    within('form') do
      fill_in 'Email', with: 'roland@gmail.com'
      fill_in 'Password', with: '123456'
    end
    click_button 'Log in'
    @picture = Picture.create(title: 'Basketball', description: 'ARENA Stadium', user: @user)
    visit new_picture_path
  end

  it 'should display picture form' do
    expect(page).to have_content('New picture')
  end
end
