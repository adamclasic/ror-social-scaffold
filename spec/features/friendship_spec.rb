require 'rails_helper'

RSpec.describe 'Friendship', type: :feature do
  before :each do
    User.create(email: 'jane@example.com', name: 'jane', password: 'password')
    User.create(email: 'john@example.com', name: 'john', password: 'password')
    visit new_user_session_path
    fill_in 'user_email', with: 'jane@example.com'
    fill_in 'user_password', with: 'password'
    click_button('submit')
    expect(page).to have_content 'Signed in successfully'
  end

  scenario 'Add friend' do
    visit users_path
    click_on('Add Friend')
    expect(page).to have_content 'Friend request sent'
  end

  scenario 'Accept friend request' do
    visit users_path
    click_on('Add Friend')
    expect(page).to have_content 'Friend request sent'
    click_on('Sign out')
    visit new_user_session_path
    fill_in 'user_email', with: 'john@example.com'
    fill_in 'user_password', with: 'password'
    click_button('submit')
    visit users_path
    click_on('Accept')
    expect(page).to have_content 'Friend request accepted'
  end

  scenario 'Deny friend request' do
    visit users_path
    click_on('Add Friend')
    expect(page).to have_content 'Friend request sent'
    click_on('Sign out')
    visit new_user_session_path
    fill_in 'user_email', with: 'john@example.com'
    fill_in 'user_password', with: 'password'
    click_button('submit')
    visit users_path
    click_on('Decline')
    expect(page).to have_content 'Friend request denied'
  end

  scenario 'Unfriend a user' do
    visit users_path
    click_on('Add Friend')
    expect(page).to have_content 'Friend request sent'
    click_on('Sign out')
    visit new_user_session_path
    fill_in 'user_email', with: 'john@example.com'
    fill_in 'user_password', with: 'password'
    click_button('submit')
    visit users_path
    click_on('Accept')
    expect(page).to have_content 'Friend request accepted'
    click_on('Sign out')
    visit new_user_session_path
    fill_in 'user_email', with: 'jane@example.com'
    fill_in 'user_password', with: 'password'
    click_button('submit')
    visit users_path
    click_on('Unfriend')
  end
end
