require 'test_helper'

class ApiControllerTest < ActionDispatch::IntegrationTest
  test "should get pipl" do
    get api_pipl_url
    assert_response :success
  end

end
