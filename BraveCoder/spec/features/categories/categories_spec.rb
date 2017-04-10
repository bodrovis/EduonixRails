require 'rails_helper'

RSpec.feature 'Categories' do
  let(:admin) { create(:admin) }
  before(:each) { sign_in user: admin }

  context 'creation' do
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

  context 'deletion' do
    let!(:category) { create(:category) }

    scenario 'should be successful', :js do
      visit categories_path
      page.accept_confirm { click_link 'Remove' }
      expect(page).not_to have_selector("#category_#{category.id}")
      #page.save_screenshot
    end
  end

  context 'editing' do
    let(:category) { create(:category) }

    scenario 'should be successful' do
      visit edit_category_path(category)
      within "#edit_category_#{category.id}" do
        fill_in 'Title', with: 'New title'
        click_button 'Submit!'
      end

      expect_success 'Category New title updated!'
    end
  end
end