module CapybaraExtensions
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