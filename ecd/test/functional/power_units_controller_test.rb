require 'test_helper'

class PowerUnitsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:power_units)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create power_unit" do
    assert_difference('PowerUnit.count') do
      post :create, :power_unit => { }
    end

    assert_redirected_to power_unit_path(assigns(:power_unit))
  end

  test "should show power_unit" do
    get :show, :id => power_units(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => power_units(:one).to_param
    assert_response :success
  end

  test "should update power_unit" do
    put :update, :id => power_units(:one).to_param, :power_unit => { }
    assert_redirected_to power_unit_path(assigns(:power_unit))
  end

  test "should destroy power_unit" do
    assert_difference('PowerUnit.count', -1) do
      delete :destroy, :id => power_units(:one).to_param
    end

    assert_redirected_to power_units_path
  end
end
