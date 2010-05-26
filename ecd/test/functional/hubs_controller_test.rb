require 'test_helper'

class HubsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hubs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hub" do
    assert_difference('Hub.count') do
      post :create, :hub => { }
    end

    assert_redirected_to hub_path(assigns(:hub))
  end

  test "should show hub" do
    get :show, :id => hubs(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => hubs(:one).to_param
    assert_response :success
  end

  test "should update hub" do
    put :update, :id => hubs(:one).to_param, :hub => { }
    assert_redirected_to hub_path(assigns(:hub))
  end

  test "should destroy hub" do
    assert_difference('Hub.count', -1) do
      delete :destroy, :id => hubs(:one).to_param
    end

    assert_redirected_to hubs_path
  end
end
