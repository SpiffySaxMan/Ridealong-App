require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:william)
    @input_attributes = { name:  "Example User",
                                          email: "user@example.com",
                                          address: "invalidaddress",
                                          password: "password",
                                          password_confirmation: "password"}

  end


  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: { name:  "",
                               email: "user@invalid",
                               address: "invalidaddress",
                               password:              "foo",
                               password_confirmation: "bar" }
    end
    assert_template 'users/new'
  end

  test "valid signup information" do
    get signup_path
    assert_difference ('User.count') do
    post_via_redirect users_path, user: @input_attributes
    end
    assert_template 'app/views/users/show'
    assert is_logged_in?
  end
end
