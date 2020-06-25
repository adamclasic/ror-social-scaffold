require 'rails_helper'

RSpec.feature 'Sign up', type: :feature do
  scenario 'Sign up a new user' do
    visit new_user_registration_path
    fill_in 'user_name', with: 'jane'
    fill_in 'user_email', with: 'jane@example.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_button('submit')
    expect(page).to have_content 'Welcome! You have signed up successfully'
  end
end
