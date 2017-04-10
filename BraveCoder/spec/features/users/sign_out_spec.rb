require 'rails_helper'

RSpec.feature 'User sign out' do
  let(:user) { create(:user) }

  before(:each) { sign_in user: user }

  scenario "it should succeed after clicking the link" do
    within '#main-menu' do
      click_link 'Sign Out'
    end

    expect_success 'See you!'

  end
end