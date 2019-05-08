require 'test_helper'

class AuthControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get auth_index_url
    assert_response :success
  end

  test "should get test" do
    get auth_test_url
    assert_response :success
  end

end
