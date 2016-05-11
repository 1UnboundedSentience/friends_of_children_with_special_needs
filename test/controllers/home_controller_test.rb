require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should redirect if not logged in" do
    get :index
    assert_response :redirect
  end

end
