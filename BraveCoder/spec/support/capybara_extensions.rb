module CapybaraExtensions
  def sign_in(user:, password: 'secret', email: user.email)
    visit new_sessions_path

    within '#new_session' do
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      click_button 'Sign In!'
    end
  end

  def expect_error(msg)
    expect_flash msg, 'danger'
  end

  def expect_success(msg)
    expect_flash msg
  end

  private

  def expect_flash(msg, key = 'success')
    within ".alert.alert-#{key}" do
      expect(page).to have_content(msg)
    end
  end
end