require 'test_helper'

class ReportsControllerTest < ActionController::TestCase
  setup do
    @report = reports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create report" do
    assert_difference('Report.count') do
      post :create, report: { communication: @report.communication, communication_comment: @report.communication_comment, enthusiasm: @report.enthusiasm, enthusiasm_comment: @report.enthusiasm_comment, further_dev: @report.further_dev, general_comments: @report.general_comments, opportunity_id: @report.opportunity_id, professionalism: @report.professionalism, professionalism_comment: @report.professionalism_comment, punctual: @report.punctual, punctual_comment: @report.punctual_comment, relevant_knowledge: @report.relevant_knowledge, relevant_knowledge_comment: @report.relevant_knowledge_comment, stength: @report.stength, type: @report.type }
    end

    assert_redirected_to report_path(assigns(:report))
  end

  test "should show report" do
    get :show, id: @report
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @report
    assert_response :success
  end

  test "should update report" do
    patch :update, id: @report, report: { communication: @report.communication, communication_comment: @report.communication_comment, enthusiasm: @report.enthusiasm, enthusiasm_comment: @report.enthusiasm_comment, further_dev: @report.further_dev, general_comments: @report.general_comments, opportunity_id: @report.opportunity_id, professionalism: @report.professionalism, professionalism_comment: @report.professionalism_comment, punctual: @report.punctual, punctual_comment: @report.punctual_comment, relevant_knowledge: @report.relevant_knowledge, relevant_knowledge_comment: @report.relevant_knowledge_comment, stength: @report.stength, type: @report.type }
    assert_redirected_to report_path(assigns(:report))
  end

  test "should destroy report" do
    assert_difference('Report.count', -1) do
      delete :destroy, id: @report
    end

    assert_redirected_to reports_path
  end
end
