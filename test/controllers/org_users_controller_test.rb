require 'test_helper'

class OrgUsersControllerTest < ActionController::TestCase
  setup do
    @org_user = org_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:org_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create org_user" do
    assert_difference('OrgUser.count') do
      post :create, org_user: { admin_status: @org_user.admin_status, organisation_id: @org_user.organisation_id, user_id: @org_user.user_id, verified_status: @org_user.verified_status }
    end

    assert_redirected_to org_user_path(assigns(:org_user))
  end

  test "should show org_user" do
    get :show, id: @org_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @org_user
    assert_response :success
  end

  test "should update org_user" do
    patch :update, id: @org_user, org_user: { admin_status: @org_user.admin_status, organisation_id: @org_user.organisation_id, user_id: @org_user.user_id, verified_status: @org_user.verified_status }
    assert_redirected_to org_user_path(assigns(:org_user))
  end

  test "should destroy org_user" do
    assert_difference('OrgUser.count', -1) do
      delete :destroy, id: @org_user
    end

    assert_redirected_to org_users_path
  end
end
