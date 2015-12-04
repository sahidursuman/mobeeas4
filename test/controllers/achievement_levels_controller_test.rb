require 'test_helper'

class AchievementLevelsControllerTest < ActionController::TestCase
  setup do
    @achievement_level = achievement_levels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:achievement_levels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create achievement_level" do
    assert_difference('AchievementLevel.count') do
      post :create, achievement_level: { name: @achievement_level.name }
    end

    assert_redirected_to achievement_level_path(assigns(:achievement_level))
  end

  test "should show achievement_level" do
    get :show, id: @achievement_level
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @achievement_level
    assert_response :success
  end

  test "should update achievement_level" do
    patch :update, id: @achievement_level, achievement_level: { name: @achievement_level.name }
    assert_redirected_to achievement_level_path(assigns(:achievement_level))
  end

  test "should destroy achievement_level" do
    assert_difference('AchievementLevel.count', -1) do
      delete :destroy, id: @achievement_level
    end

    assert_redirected_to achievement_levels_path
  end
end
