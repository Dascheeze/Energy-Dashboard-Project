require 'test_helper'

class TestsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create test" do
    assert_difference('Test.count') do
      post :create, :test => { }
    end

    assert_redirected_to test_path(assigns(:test))
  end

  test "should show test" do
    get :show, :id => tests(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => tests(:one).to_param
    assert_response :success
  end

  test "should update test" do
    put :update, :id => tests(:one).to_param, :test => { }
    assert_redirected_to test_path(assigns(:test))
  end

  test "should destroy test" do
    assert_difference('Test.count', -1) do
      delete :destroy, :id => tests(:one).to_param
    end

    assert_redirected_to tests_path
  end
end
