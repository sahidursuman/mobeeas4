require 'test_helper'

class AdminsControllerTest < ActionController::TestCase
  setup do
    @admin = admins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin" do
    assert_difference('Admin.count') do
      post :create, admin: { address: @admin.address, first_name: @admin.first_name, guid: @admin.guid, last_name: @admin.last_name, phone: @admin.phone, postcode: @admin.postcode, state: @admin.state, suburb: @admin.suburb, user_id: @admin.user_id }
    end

    assert_redirected_to admin_path(assigns(:admin))
  end

  test "should show admin" do
    get :show, id: @admin
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin
    assert_response :success
  end

  test "should update admin" do
    patch :update, id: @admin, admin: { address: @admin.address, first_name: @admin.first_name, guid: @admin.guid, last_name: @admin.last_name, phone: @admin.phone, postcode: @admin.postcode, state: @admin.state, suburb: @admin.suburb, user_id: @admin.user_id }
    assert_redirected_to admin_path(assigns(:admin))
  end

  test "should destroy admin" do
    assert_difference('Admin.count', -1) do
      delete :destroy, id: @admin
    end

    assert_redirected_to admins_path
  end
end
