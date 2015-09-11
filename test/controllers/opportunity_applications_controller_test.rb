require 'test_helper'

class OpportunityApplicationsControllerTest < ActionController::TestCase
  setup do
    @opportunity_application = opportunity_applications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:opportunity_applications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create opportunity_application" do
    assert_difference('OpportunityApplication.count') do
      post :create, opportunity_application: { application_status: @opportunity_application.application_status, introduction: @opportunity_application.introduction, opportunity_id: @opportunity_application.opportunity_id, user_id: @opportunity_application.user_id }
    end

    assert_redirected_to opportunity_application_path(assigns(:opportunity_application))
  end

  test "should show opportunity_application" do
    get :show, id: @opportunity_application
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @opportunity_application
    assert_response :success
  end

  test "should update opportunity_application" do
    patch :update, id: @opportunity_application, opportunity_application: { application_status: @opportunity_application.application_status, introduction: @opportunity_application.introduction, opportunity_id: @opportunity_application.opportunity_id, user_id: @opportunity_application.user_id }
    assert_redirected_to opportunity_application_path(assigns(:opportunity_application))
  end

  test "should destroy opportunity_application" do
    assert_difference('OpportunityApplication.count', -1) do
      delete :destroy, id: @opportunity_application
    end

    assert_redirected_to opportunity_applications_path
  end
end
