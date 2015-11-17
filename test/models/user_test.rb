require 'test_helper'

class UserTest < ActiveSupport::TestCase
    def setup
    @user = User.new(name: "Example User", email: "user@example.com")
  end

  test "should be valid" do
    assert @user.valid?
  end
  test "Northland CAPS email" do
	@user.email = "@northlandcaps.org"
	assert_not @user.valid?
	end
end
