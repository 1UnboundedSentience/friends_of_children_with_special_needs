require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should redirect if not logged in" do
    get :index
    assert_response :redirect
  end

  test "should get index if logged in" do
  	get :index
  	assert_template layout: "layouts/application"
  end

end
