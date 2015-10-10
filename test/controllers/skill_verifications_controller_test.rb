require 'test_helper'

class SkillVerificationsControllerTest < ActionController::TestCase
  setup do
    @skill_verification = skill_verifications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:skill_verifications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create skill_verification" do
    assert_difference('SkillVerification.count') do
      post :create, skill_verification: { accomplishments: @skill_verification.accomplishments, communication: @skill_verification.communication, presentation: @skill_verification.presentation, referree_email: @skill_verification.referree_email, referree_name: @skill_verification.referree_name, referree_phone: @skill_verification.referree_phone, referree_relationship: @skill_verification.referree_relationship, time_known: @skill_verification.time_known, user_id: @skill_verification.user_id, work_ethic: @skill_verification.work_ethic }
    end

    assert_redirected_to skill_verification_path(assigns(:skill_verification))
  end

  test "should show skill_verification" do
    get :show, id: @skill_verification
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @skill_verification
    assert_response :success
  end

  test "should update skill_verification" do
    patch :update, id: @skill_verification, skill_verification: { accomplishments: @skill_verification.accomplishments, communication: @skill_verification.communication, presentation: @skill_verification.presentation, referree_email: @skill_verification.referree_email, referree_name: @skill_verification.referree_name, referree_phone: @skill_verification.referree_phone, referree_relationship: @skill_verification.referree_relationship, time_known: @skill_verification.time_known, user_id: @skill_verification.user_id, work_ethic: @skill_verification.work_ethic }
    assert_redirected_to skill_verification_path(assigns(:skill_verification))
  end

  test "should destroy skill_verification" do
    assert_difference('SkillVerification.count', -1) do
      delete :destroy, id: @skill_verification
    end

    assert_redirected_to skill_verifications_path
  end
end
