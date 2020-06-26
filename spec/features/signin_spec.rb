require 'rails_helper'

RSpec.feature 'Sign in', type: :feature do
  before :each do
    User.create(email: 'jane@example.com', name: 'jane', password: 'password')
  end

  scenario 'Sign in a user' do
    visit new_user_session_path
    fill_in 'user_email', with: 'jane@example.com'
    fill_in 'user_password', with: 'password'
    click_button('submit')
    expect(page).to have_content 'Signed in successfully'
  end
end
