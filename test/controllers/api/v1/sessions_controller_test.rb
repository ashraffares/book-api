require "test_helper"

class Api::V1::SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get api_v1_sessions_login_url
    assert_response :success
  end

  test "should get registeration" do
    get api_v1_sessions_registeration_url
    assert_response :success
  end
end
