require "test_helper"

class InterestsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get interests_new_url
    assert_response :success
  end
end
