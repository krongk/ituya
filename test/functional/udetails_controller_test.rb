require 'test_helper'

class UdetailsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:udetails)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create udetail" do
    assert_difference('Udetail.count') do
      post :create, :udetail => { }
    end

    assert_redirected_to udetail_path(assigns(:udetail))
  end

  test "should show udetail" do
    get :show, :id => udetails(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => udetails(:one).to_param
    assert_response :success
  end

  test "should update udetail" do
    put :update, :id => udetails(:one).to_param, :udetail => { }
    assert_redirected_to udetail_path(assigns(:udetail))
  end

  test "should destroy udetail" do
    assert_difference('Udetail.count', -1) do
      delete :destroy, :id => udetails(:one).to_param
    end

    assert_redirected_to udetails_path
  end
end
