require 'test_helper'

class BruceControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bruce_index_url
    assert_response :success
  end

end
