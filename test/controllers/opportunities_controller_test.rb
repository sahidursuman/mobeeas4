require 'test_helper'

class OpportunitiesControllerTest < ActionController::TestCase
  setup do
    @opportunity = opportunities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:opportunities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create opportunity" do
    assert_difference('Opportunity.count') do
      post :create, opportunity: { commencement_date: @opportunity.commencement_date, completion_date: @opportunity.completion_date, duration: @opportunity.duration, info: @opportunity.info, name: @opportunity.name, opportunity_status: @opportunity.opportunity_status, organisation_id: @opportunity.organisation_id, pay: @opportunity.pay, planned_start_date: @opportunity.planned_start_date, tagline: @opportunity.tagline, user_id: @opportunity.user_id }
    end

    assert_redirected_to opportunity_path(assigns(:opportunity))
  end

  test "should show opportunity" do
    get :show, id: @opportunity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @opportunity
    assert_response :success
  end

  test "should update opportunity" do
    patch :update, id: @opportunity, opportunity: { commencement_date: @opportunity.commencement_date, completion_date: @opportunity.completion_date, duration: @opportunity.duration, info: @opportunity.info, name: @opportunity.name, opportunity_status: @opportunity.opportunity_status, organisation_id: @opportunity.organisation_id, pay: @opportunity.pay, planned_start_date: @opportunity.planned_start_date, tagline: @opportunity.tagline, user_id: @opportunity.user_id }
    assert_redirected_to opportunity_path(assigns(:opportunity))
  end

  test "should destroy opportunity" do
    assert_difference('Opportunity.count', -1) do
      delete :destroy, id: @opportunity
    end

    assert_redirected_to opportunities_path
  end
end
