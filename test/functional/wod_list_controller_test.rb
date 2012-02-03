require 'test_helper'

class WodListControllerTest < ActionController::TestCase
  test "should get parse" do
    get :parse
    assert_response :success
  end

end
