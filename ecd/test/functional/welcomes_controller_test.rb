require 'test_helper'

class WelcomesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:welcomes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create welcome" do
    assert_difference('Welcome.count') do
      post :create, :welcome => { }
    end

    assert_redirected_to welcome_path(assigns(:welcome))
  end

  test "should show welcome" do
    get :show, :id => welcomes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => welcomes(:one).to_param
    assert_response :success
  end

  test "should update welcome" do
    put :update, :id => welcomes(:one).to_param, :welcome => { }
    assert_redirected_to welcome_path(assigns(:welcome))
  end

  test "should destroy welcome" do
    assert_difference('Welcome.count', -1) do
      delete :destroy, :id => welcomes(:one).to_param
    end

    assert_redirected_to welcomes_path
  end
end
