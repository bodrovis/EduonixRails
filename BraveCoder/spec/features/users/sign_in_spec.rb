require 'rails_helper'

RSpec.feature 'User sign in' do
  let(:user) { create(:user) }

  before(:each) { visit new_session_path }

  scenario 'it should succeed with the proper email and a password' do
    within '#new_session' do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: 'secret'
      click_button 'Log In!'
    end

    expect_success "Welcome back, #{user.name}!"
  end

  scenario 'it should not succeed with an incorrect email' do
    within '#new_session' do
      fill_in 'Email', with: ''
      fill_in 'Password', with: 'secret'
      click_button 'Log In!'
    end

    expect_error "Incorrect email and/or password..."
  end

  scenario 'it should not succeed with an incorrect password' do
    within '#new_session' do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: '123'
      click_button 'Log In!'
    end

    expect_error "Incorrect email and/or password..."
  end
end