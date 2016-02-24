require 'test_helper'

class ExpressionOfInterestsControllerTest < ActionController::TestCase
  setup do
    @expression_of_interest = expression_of_interests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:expression_of_interests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create expression_of_interest" do
    assert_difference('ExpressionOfInterest.count') do
      post :create, expression_of_interest: { approved: @expression_of_interest.approved, opportunity_id: @expression_of_interest.opportunity_id, sponsor_id: @expression_of_interest.sponsor_id }
    end

    assert_redirected_to expression_of_interest_path(assigns(:expression_of_interest))
  end

  test "should show expression_of_interest" do
    get :show, id: @expression_of_interest
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @expression_of_interest
    assert_response :success
  end

  test "should update expression_of_interest" do
    patch :update, id: @expression_of_interest, expression_of_interest: { approved: @expression_of_interest.approved, opportunity_id: @expression_of_interest.opportunity_id, sponsor_id: @expression_of_interest.sponsor_id }
    assert_redirected_to expression_of_interest_path(assigns(:expression_of_interest))
  end

  test "should destroy expression_of_interest" do
    assert_difference('ExpressionOfInterest.count', -1) do
      delete :destroy, id: @expression_of_interest
    end

    assert_redirected_to expression_of_interests_path
  end
end
