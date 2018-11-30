require 'test_helper'

class SubscriptorsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get subscriptors_new_url
    assert_response :success
  end

  test "should get create" do
    get subscriptors_create_url
    assert_response :success
  end

end
