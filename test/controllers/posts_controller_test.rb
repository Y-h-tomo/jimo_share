require 'test_helper'

class PostControllerTest < ActionDispatch::IntegrationTest
  test "should get posts" do
    get post_posts_url
    assert_response :success
  end

end
