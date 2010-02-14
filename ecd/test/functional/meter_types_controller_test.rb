require 'test_helper'

class MeterTypesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:meter_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create meter_type" do
    assert_difference('MeterType.count') do
      post :create, :meter_type => { }
    end

    assert_redirected_to meter_type_path(assigns(:meter_type))
  end

  test "should show meter_type" do
    get :show, :id => meter_types(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => meter_types(:one).to_param
    assert_response :success
  end

  test "should update meter_type" do
    put :update, :id => meter_types(:one).to_param, :meter_type => { }
    assert_redirected_to meter_type_path(assigns(:meter_type))
  end

  test "should destroy meter_type" do
    assert_difference('MeterType.count', -1) do
      delete :destroy, :id => meter_types(:one).to_param
    end

    assert_redirected_to meter_types_path
  end
end
