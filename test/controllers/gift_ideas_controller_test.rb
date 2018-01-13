require 'test_helper'

class GiftIdeasControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get gift_ideas_show_url
    assert_response :success
  end

end
