require 'test_helper'

class HoacUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get hoac_users_new_url
    assert_response :success
  end

end
