require 'test_helper'

class EngagementsControllerTest < ActionController::TestCase
  setup do
    @engagement = engagements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:engagements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create engagement" do
    assert_difference('Engagement.count') do
      post :create, engagement: { opportunity_id: @engagement.opportunity_id, profile_id: @engagement.profile_id, status: @engagement.status }
    end

    assert_redirected_to engagement_path(assigns(:engagement))
  end

  test "should show engagement" do
    get :show, id: @engagement
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @engagement
    assert_response :success
  end

  test "should update engagement" do
    patch :update, id: @engagement, engagement: { opportunity_id: @engagement.opportunity_id, profile_id: @engagement.profile_id, status: @engagement.status }
    assert_redirected_to engagement_path(assigns(:engagement))
  end

  test "should destroy engagement" do
    assert_difference('Engagement.count', -1) do
      delete :destroy, id: @engagement
    end

    assert_redirected_to engagements_path
  end
end
