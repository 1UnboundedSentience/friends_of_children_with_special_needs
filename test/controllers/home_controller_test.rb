require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should redirect if not logged in" do
    get :index
    assert_response :redirect
  end

  test "should stay on sign in page if not signed in and user attempts to click a resource-specific button" do

  end

end
