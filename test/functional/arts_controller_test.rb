require 'test_helper'

class ArtsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:arts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create art" do
    assert_difference('Art.count') do
      post :create, :art => { }
    end

    assert_redirected_to art_path(assigns(:art))
  end

  test "should show art" do
    get :show, :id => arts(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => arts(:one).to_param
    assert_response :success
  end

  test "should update art" do
    put :update, :id => arts(:one).to_param, :art => { }
    assert_redirected_to art_path(assigns(:art))
  end

  test "should destroy art" do
    assert_difference('Art.count', -1) do
      delete :destroy, :id => arts(:one).to_param
    end

    assert_redirected_to arts_path
  end
end
