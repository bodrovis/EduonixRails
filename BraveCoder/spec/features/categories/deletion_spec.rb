require 'rails_helper'

RSpec.feature 'Category deletion' do
  let!(:category) { create(:category) }

  scenario 'should be successful', :js do
    visit categories_path
    page.accept_confirm { click_link 'Remove' }
    expect(page).not_to have_selector("#category_#{category.id}")
    #page.save_screenshot
  end
end