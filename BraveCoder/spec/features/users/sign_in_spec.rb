require 'rails_helper'

RSpec.feature 'User sign in' do
  let(:user) { create(:user) }

  context 'valid credentials' do
    before(:each) { sign_in user: user }

    scenario 'it should succeed with the proper email and a password' do
      expect_success "Welcome back, #{user.name}!"

      within '#main-menu' do
        expect(page).not_to have_content('Sign In')
        expect(page).not_to have_content('Register')
      end
    end
  end

  context 'invalid credentials' do
    scenario 'it should not succeed with an incorrect email' do
      sign_in user: user, email: 'invalid'

      expect_error "Incorrect email and/or password..."
    end

    scenario 'it should not succeed with an incorrect password' do
      sign_in user: user, password: 'invalid'

      expect_error "Incorrect email and/or password..."
    end
  end
end