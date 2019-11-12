require 'test_helper'

class PlanetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @planet = planets(:one)
  end

  test "should get index" do
    get planets_url
    assert_response :success
  end

  test "should show planet" do
    get planet_url(@planet)
    assert_response :success
  end
end
