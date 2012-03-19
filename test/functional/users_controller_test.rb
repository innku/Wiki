require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  
  setup do
    sign_in FactoryGirl.create(:user)
  end
  
  test "should get new" do
    get :new
    assert_response :success
  end
end
