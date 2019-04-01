require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get help" do
    get home_help_url
    assert_response :success
  end

  test "should get FishermansFriend" do
    get home_FishermansFriend_url
    assert_response :success
  end

end
