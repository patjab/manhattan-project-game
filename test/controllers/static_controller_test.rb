require 'test_helper'

class StaticControllerTest < ActionDispatch::IntegrationTest
  test "should get rules" do
    get static_rules_url
    assert_response :success
  end

end
