class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]

  # GET /reports
  # GET /reports.json
  def index
    @reports = Report.all
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
    @opportunity = Opportunity.find(@report.opportunity_id)
    @profile = Profile.find(@report.profile_id)
    # @engagement = Engagement.find(params[:engagement_id])

  end

  # GET /reports/new
  def new
    @report = Report.new
    @opportunity = Opportunity.find(params[:opportunity_id])
    @profile = Profile.find(params[:profile_id])
    @engagement = Engagement.find(params[:engagement_id])
  end

  # GET /reports/1/edit
  def edit
    @opportunity = Opportunity.find(params[:opportunity_id])
    @profile = Profile.find(params[:profile_id])
  end

  # POST /reports
  # POST /reports.json
  def create
    @report = Report.new(report_params)
    # @opportunity = Opportunity.find(params[:opportunity_id])
    # @profile = Profile.find(params[:profile_id])
    @engagement = Engagement.find(params[:engagement_id])

    respond_to do |format|
      if @report.save
        # The new report id should be entered into the column in the engagements table
        puts "hello " + params[:engagement_id]

        if params[:report_type] == 'progress'
          @engagement.update_attributes(progress_report_id: @report.id)
          @engagement.save!
        elsif params[:report_type] == 'completion'
          @engagement.update_attributes(completion_report_id: @report.id)
          @engagement.save!
        end

        format.html { redirect_to @report, notice: 'Report was successfully created.' }
        format.json { render :show, status: :created, location: @report }
      else
        format.html { render :new }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reports/1
  # PATCH/PUT /reports/1.json
  def update
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to @report, notice: 'Report was successfully updated.' }
        format.json { render :show, status: :ok, location: @report }
      else
        format.html { render :edit }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @report.destroy
    respond_to do |format|
      format.html { redirect_to reports_url, notice: 'Report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_params
      params.require(:report).permit(:opportunity_id, :report_type, :relevant_knowledge, :relevant_knowledge_comment, :punctual, :punctual_comment, :communication, :communication_comment, :enthusiasm, :enthusiasm_comment, :professionalism, :professionalism_comment, :stength, :further_dev, :general_comments, :profile_id)
    end
end
