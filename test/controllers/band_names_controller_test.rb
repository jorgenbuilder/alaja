require 'test_helper'

class BandNamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @band_name = band_names(:one)
  end

  test "should get index" do
    get band_names_url
    assert_response :success
  end

  test "should get new" do
    get new_band_name_url
    assert_response :success
  end

  test "should create band_name" do
    assert_difference('BandName.count') do
      post band_names_url, params: { band_name: { date: @band_name.date, name: @band_name.name } }
    end

    assert_redirected_to band_name_url(BandName.last)
  end

  test "should show band_name" do
    get band_name_url(@band_name)
    assert_response :success
  end

  test "should get edit" do
    get edit_band_name_url(@band_name)
    assert_response :success
  end

  test "should update band_name" do
    patch band_name_url(@band_name), params: { band_name: { date: @band_name.date, name: @band_name.name } }
    assert_redirected_to band_name_url(@band_name)
  end

  test "should destroy band_name" do
    assert_difference('BandName.count', -1) do
      delete band_name_url(@band_name)
    end

    assert_redirected_to band_names_url
  end
end
