require 'test_helper'

class ApodControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get apod_index_url
    assert_response :success
  end

end
