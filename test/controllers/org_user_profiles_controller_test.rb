require 'test_helper'

class OrgUserProfilesControllerTest < ActionController::TestCase
  setup do
    @org_user_profile = org_user_profiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:org_user_profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create org_user_profile" do
    assert_difference('OrgUserProfile.count') do
      post :create, org_user_profile: { admin_status: @org_user_profile.admin_status, first_name: @org_user_profile.first_name, guid: @org_user_profile.guid, last_name: @org_user_profile.last_name, phone: @org_user_profile.phone, position: @org_user_profile.position, user_id: @org_user_profile.user_id, verified_status: @org_user_profile.verified_status }
    end

    assert_redirected_to org_user_profile_path(assigns(:org_user_profile))
  end

  test "should show org_user_profile" do
    get :show, id: @org_user_profile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @org_user_profile
    assert_response :success
  end

  test "should update org_user_profile" do
    patch :update, id: @org_user_profile, org_user_profile: { admin_status: @org_user_profile.admin_status, first_name: @org_user_profile.first_name, guid: @org_user_profile.guid, last_name: @org_user_profile.last_name, phone: @org_user_profile.phone, position: @org_user_profile.position, user_id: @org_user_profile.user_id, verified_status: @org_user_profile.verified_status }
    assert_redirected_to org_user_profile_path(assigns(:org_user_profile))
  end

  test "should destroy org_user_profile" do
    assert_difference('OrgUserProfile.count', -1) do
      delete :destroy, id: @org_user_profile
    end

    assert_redirected_to org_user_profiles_path
  end
end
