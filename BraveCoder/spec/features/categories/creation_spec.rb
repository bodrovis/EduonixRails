require 'rails_helper'

RSpec.feature 'Category creation' do
  scenario 'should be successful' do
    visit new_category_path
    within '#new_category' do
      fill_in 'Title', with: 'Test category'
      fill_in 'Description', with: 'Test desc'
      click_button 'Submit!'
    end

    expect_success 'Category added!'
  end
end