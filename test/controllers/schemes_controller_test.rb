require 'test_helper'

class SchemesControllerTest < ActionDispatch::IntegrationTest
  test "should get scheme" do
    get schemes_scheme_url
    assert_response :success
  end

end
