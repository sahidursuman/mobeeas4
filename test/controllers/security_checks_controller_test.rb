require 'test_helper'

class SecurityChecksControllerTest < ActionController::TestCase
  setup do
    @security_check = security_checks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:security_checks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create security_check" do
    assert_difference('SecurityCheck.count') do
      post :create, security_check: { checked: @security_check.checked, checked_by: @security_check.checked_by, expiry_date: @security_check.expiry_date, name: @security_check.name, number: @security_check.number, state: @security_check.state, user_id: @security_check.user_id }
    end

    assert_redirected_to security_check_path(assigns(:security_check))
  end

  test "should show security_check" do
    get :show, id: @security_check
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @security_check
    assert_response :success
  end

  test "should update security_check" do
    patch :update, id: @security_check, security_check: { checked: @security_check.checked, checked_by: @security_check.checked_by, expiry_date: @security_check.expiry_date, name: @security_check.name, number: @security_check.number, state: @security_check.state, user_id: @security_check.user_id }
    assert_redirected_to security_check_path(assigns(:security_check))
  end

  test "should destroy security_check" do
    assert_difference('SecurityCheck.count', -1) do
      delete :destroy, id: @security_check
    end

    assert_redirected_to security_checks_path
  end
end
