require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  test "should get index" do
    sign_in FactoryGirl.create(:user)
    get :index
    assert_response :success
  end

end
