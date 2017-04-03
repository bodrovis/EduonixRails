require 'rails_helper'

RSpec.feature 'User registration' do
  before(:each) { visit new_user_path }

  context 'with invalid data' do
    scenario 'should succeed' do
      within '#new_user' do
        fill_in 'Name', with: 'J'
        fill_in 'Email', with: ''
        fill_in 'Password', with: 'secret'
        fill_in 'Password confirmation', with: 'some pass'
        click_button 'Register!'
      end

      expect_error 'Name is too short'
      expect_error 'Email can\'t be blank'
      expect_error 'Password confirmation doesn\'t match Password'
    end
  end

  context 'with valid data' do
    scenario 'should succeed' do
      within '#new_user' do
        fill_in 'Name', with: 'John Doe'
        fill_in 'Email', with: 'john@example.com'
        fill_in 'Password', with: 'secret'
        fill_in 'Password confirmation', with: 'secret'
        click_button 'Register!'
      end

      expect_success 'Welcome, John Doe!'
    end
  end
end