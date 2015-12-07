require 'test_helper'

class ReportAchievementLevelsControllerTest < ActionController::TestCase
  setup do
    @report_achievement_level = report_achievement_levels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:report_achievement_levels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create report_achievement_level" do
    assert_difference('ReportAchievementLevel.count') do
      post :create, report_achievement_level: { achievement_level_id: @report_achievement_level.achievement_level_id, performance_descriptor: @report_achievement_level.performance_descriptor, report_id: @report_achievement_level.report_id }
    end

    assert_redirected_to report_achievement_level_path(assigns(:report_achievement_level))
  end

  test "should show report_achievement_level" do
    get :show, id: @report_achievement_level
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @report_achievement_level
    assert_response :success
  end

  test "should update report_achievement_level" do
    patch :update, id: @report_achievement_level, report_achievement_level: { achievement_level_id: @report_achievement_level.achievement_level_id, performance_descriptor: @report_achievement_level.performance_descriptor, report_id: @report_achievement_level.report_id }
    assert_redirected_to report_achievement_level_path(assigns(:report_achievement_level))
  end

  test "should destroy report_achievement_level" do
    assert_difference('ReportAchievementLevel.count', -1) do
      delete :destroy, id: @report_achievement_level
    end

    assert_redirected_to report_achievement_levels_path
  end
end
