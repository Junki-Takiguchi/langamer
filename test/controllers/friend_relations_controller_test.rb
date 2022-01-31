require 'test_helper'

class FriendRelationsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get friend_relations_create_url
    assert_response :success
  end

  test "should get destroy" do
    get friend_relations_destroy_url
    assert_response :success
  end

end
