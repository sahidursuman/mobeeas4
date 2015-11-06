require 'test_helper'

class OpportunityTimesControllerTest < ActionController::TestCase
  setup do
    @opportunity_time = opportunity_times(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:opportunity_times)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create opportunity_time" do
    assert_difference('OpportunityTime.count') do
      post :create, opportunity_time: { date: @opportunity_time.date, day: @opportunity_time.day, frequency: @opportunity_time.frequency, opportunity_id: @opportunity_time.opportunity_id, time: @opportunity_time.time }
    end

    assert_redirected_to opportunity_time_path(assigns(:opportunity_time))
  end

  test "should show opportunity_time" do
    get :show, id: @opportunity_time
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @opportunity_time
    assert_response :success
  end

  test "should update opportunity_time" do
    patch :update, id: @opportunity_time, opportunity_time: { date: @opportunity_time.date, day: @opportunity_time.day, frequency: @opportunity_time.frequency, opportunity_id: @opportunity_time.opportunity_id, time: @opportunity_time.time }
    assert_redirected_to opportunity_time_path(assigns(:opportunity_time))
  end

  test "should destroy opportunity_time" do
    assert_difference('OpportunityTime.count', -1) do
      delete :destroy, id: @opportunity_time
    end

    assert_redirected_to opportunity_times_path
  end
end
