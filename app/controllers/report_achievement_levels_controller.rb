class ReportAchievementLevelsController < ApplicationController
  before_action :set_report_achievement_level, only: [:show, :edit, :update, :destroy]

  # GET /report_achievement_levels
  # GET /report_achievement_levels.json
  def index
    @report_achievement_levels = ReportAchievementLevel.all
  end

  # GET /report_achievement_levels/1
  # GET /report_achievement_levels/1.json
  def show
  end

  # GET /report_achievement_levels/new
  def new
    @report_achievement_level = ReportAchievementLevel.new
  end

  # GET /report_achievement_levels/1/edit
  def edit
  end

  # POST /report_achievement_levels
  # POST /report_achievement_levels.json
  def create
    @report_achievement_level = ReportAchievementLevel.new(report_achievement_level_params)

    respond_to do |format|
      if @report_achievement_level.save
        format.html { redirect_to @report_achievement_level, notice: 'Report achievement level was successfully created.' }
        format.json { render :show, status: :created, location: @report_achievement_level }
      else
        format.html { render :new }
        format.json { render json: @report_achievement_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /report_achievement_levels/1
  # PATCH/PUT /report_achievement_levels/1.json
  def update
    respond_to do |format|
      if @report_achievement_level.update(report_achievement_level_params)
        format.html { redirect_to @report_achievement_level, notice: 'Report achievement level was successfully updated.' }
        format.json { render :show, status: :ok, location: @report_achievement_level }
      else
        format.html { render :edit }
        format.json { render json: @report_achievement_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /report_achievement_levels/1
  # DELETE /report_achievement_levels/1.json
  def destroy
    @report_achievement_level.destroy
    respond_to do |format|
      format.html { redirect_to report_achievement_levels_url, notice: 'Report achievement level was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report_achievement_level
      @report_achievement_level = ReportAchievementLevel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_achievement_level_params
      params.require(:report_achievement_level).permit(:report_id, :achievement_level_id, :performance_descriptor)
    end
end
