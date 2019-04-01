require 'test_helper'

class FishermanFriendControllerTest < ActionDispatch::IntegrationTest
  test "should get about" do
    get fisherman_friend_about_url
    assert_response :success
  end

  test "should get contact" do
    get fisherman_friend_contact_url
    assert_response :success
  end

end
