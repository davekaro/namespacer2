require 'test_helper'

class Webinars::PositionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @webinars_position = webinars_positions(:one)
  end

  test "should get index" do
    get webinars_positions_url
    assert_response :success
  end

  test "should get new" do
    get new_webinars_position_url
    assert_response :success
  end

  test "should create webinars_position" do
    assert_difference('Webinars::Position.count') do
      post webinars_positions_url, params: { webinars_position: { name: @webinars_position.name } }
    end

    assert_redirected_to webinars_position_url(Webinars::Position.last)
  end

  test "should show webinars_position" do
    get webinars_position_url(@webinars_position)
    assert_response :success
  end

  test "should get edit" do
    get edit_webinars_position_url(@webinars_position)
    assert_response :success
  end

  test "should update webinars_position" do
    patch webinars_position_url(@webinars_position), params: { webinars_position: { name: @webinars_position.name } }
    assert_redirected_to webinars_position_url(@webinars_position)
  end

  test "should destroy webinars_position" do
    assert_difference('Webinars::Position.count', -1) do
      delete webinars_position_url(@webinars_position)
    end

    assert_redirected_to webinars_positions_url
  end
end
