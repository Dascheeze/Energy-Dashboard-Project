require 'test_helper'

class DatasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:datas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create data" do
    assert_difference('Data.count') do
      post :create, :data => { }
    end

    assert_redirected_to data_path(assigns(:data))
  end

  test "should show data" do
    get :show, :id => datas(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => datas(:one).to_param
    assert_response :success
  end

  test "should update data" do
    put :update, :id => datas(:one).to_param, :data => { }
    assert_redirected_to data_path(assigns(:data))
  end

  test "should destroy data" do
    assert_difference('Data.count', -1) do
      delete :destroy, :id => datas(:one).to_param
    end

    assert_redirected_to datas_path
  end
end
