require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get hometab" do
    get home_hometab_url
    assert_response :success
  end

  test "should get ray" do
    get home_ray_url
    assert_response :success
  end

  test "should get smartcity" do
    get home_smartcity_url
    assert_response :success
  end

  test "should get location" do
    get home_location_url
    assert_response :success
  end

  test "should get societyreg" do
    get home_societyreg_url
    assert_response :success
  end

  test "should get download" do
    get home_download_url
    assert_response :success
  end

  test "should get tnc" do
    get home_tnc_url
    assert_response :success
  end

  test "should get blog" do
    get home_blog_url
    assert_response :success
  end

  test "should get contact" do
    get home_contact_url
    assert_response :success
  end

end
