require 'test_helper'

class IndicesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:indices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create index" do
    assert_difference('Index.count') do
      post :create, :index => { }
    end

    assert_redirected_to index_path(assigns(:index))
  end

  test "should show index" do
    get :show, :id => indices(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => indices(:one).to_param
    assert_response :success
  end

  test "should update index" do
    put :update, :id => indices(:one).to_param, :index => { }
    assert_redirected_to index_path(assigns(:index))
  end

  test "should destroy index" do
    assert_difference('Index.count', -1) do
      delete :destroy, :id => indices(:one).to_param
    end

    assert_redirected_to indices_path
  end
end
