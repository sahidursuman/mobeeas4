class AchievementLevelsController < ApplicationController
  before_action :set_achievement_level, only: [:show, :edit, :update, :destroy]

  # GET /achievement_levels
  # GET /achievement_levels.json
  def index
    @achievement_levels = AchievementLevel.all
  end

  # GET /achievement_levels/1
  # GET /achievement_levels/1.json
  def show
  end

  # GET /achievement_levels/new
  def new
    @achievement_level = AchievementLevel.new
  end

  # GET /achievement_levels/1/edit
  def edit
  end

  # POST /achievement_levels
  # POST /achievement_levels.json
  def create
    @achievement_level = AchievementLevel.new(achievement_level_params)

    respond_to do |format|
      if @achievement_level.save
        format.html { redirect_to @achievement_level, notice: 'Achievement level was successfully created.' }
        format.json { render :show, status: :created, location: @achievement_level }
      else
        format.html { render :new }
        format.json { render json: @achievement_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /achievement_levels/1
  # PATCH/PUT /achievement_levels/1.json
  def update
    respond_to do |format|
      if @achievement_level.update(achievement_level_params)
        format.html { redirect_to @achievement_level, notice: 'Achievement level was successfully updated.' }
        format.json { render :show, status: :ok, location: @achievement_level }
      else
        format.html { render :edit }
        format.json { render json: @achievement_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /achievement_levels/1
  # DELETE /achievement_levels/1.json
  def destroy
    @achievement_level.destroy
    respond_to do |format|
      format.html { redirect_to achievement_levels_url, notice: 'Achievement level was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_achievement_level
      @achievement_level = AchievementLevel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def achievement_level_params
      params.require(:achievement_level).permit(:name)
    end
end
