require 'test_helper'

class NationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get nations_new_url
    assert_response :success
  end

  test "should get create" do
    get nations_create_url
    assert_response :success
  end

  test "should get show" do
    get nations_show_url
    assert_response :success
  end

end
