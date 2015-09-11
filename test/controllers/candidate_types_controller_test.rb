require 'test_helper'

class CandidateTypesControllerTest < ActionController::TestCase
  setup do
    @candidate_type = candidate_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:candidate_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create candidate_type" do
    assert_difference('CandidateType.count') do
      post :create, candidate_type: { description: @candidate_type.description, name: @candidate_type.name }
    end

    assert_redirected_to candidate_type_path(assigns(:candidate_type))
  end

  test "should show candidate_type" do
    get :show, id: @candidate_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @candidate_type
    assert_response :success
  end

  test "should update candidate_type" do
    patch :update, id: @candidate_type, candidate_type: { description: @candidate_type.description, name: @candidate_type.name }
    assert_redirected_to candidate_type_path(assigns(:candidate_type))
  end

  test "should destroy candidate_type" do
    assert_difference('CandidateType.count', -1) do
      delete :destroy, id: @candidate_type
    end

    assert_redirected_to candidate_types_path
  end
end
