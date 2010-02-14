require 'test_helper'

class MetersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:meters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create meter" do
    assert_difference('Meter.count') do
      post :create, :meter => { }
    end

    assert_redirected_to meter_path(assigns(:meter))
  end

  test "should show meter" do
    get :show, :id => meters(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => meters(:one).to_param
    assert_response :success
  end

  test "should update meter" do
    put :update, :id => meters(:one).to_param, :meter => { }
    assert_redirected_to meter_path(assigns(:meter))
  end

  test "should destroy meter" do
    assert_difference('Meter.count', -1) do
      delete :destroy, :id => meters(:one).to_param
    end

    assert_redirected_to meters_path
  end
end
