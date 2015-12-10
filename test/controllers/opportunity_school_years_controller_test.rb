require 'test_helper'

class OpportunitySchoolYearsControllerTest < ActionController::TestCase
  setup do
    @opportunity_school_year = opportunity_school_years(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:opportunity_school_years)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create opportunity_school_year" do
    assert_difference('OpportunitySchoolYear.count') do
      post :create, opportunity_school_year: { number_of_students: @opportunity_school_year.number_of_students, opportunity_id: @opportunity_school_year.opportunity_id, school_year_id: @opportunity_school_year.school_year_id }
    end

    assert_redirected_to opportunity_school_year_path(assigns(:opportunity_school_year))
  end

  test "should show opportunity_school_year" do
    get :show, id: @opportunity_school_year
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @opportunity_school_year
    assert_response :success
  end

  test "should update opportunity_school_year" do
    patch :update, id: @opportunity_school_year, opportunity_school_year: { number_of_students: @opportunity_school_year.number_of_students, opportunity_id: @opportunity_school_year.opportunity_id, school_year_id: @opportunity_school_year.school_year_id }
    assert_redirected_to opportunity_school_year_path(assigns(:opportunity_school_year))
  end

  test "should destroy opportunity_school_year" do
    assert_difference('OpportunitySchoolYear.count', -1) do
      delete :destroy, id: @opportunity_school_year
    end

    assert_redirected_to opportunity_school_years_path
  end
end
