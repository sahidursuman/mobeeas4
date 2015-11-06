class OpportunityTimesController < ApplicationController
  before_action :set_opportunity_time, only: [:show, :edit, :update, :destroy]

  # GET /opportunity_times
  # GET /opportunity_times.json
  def index
    @opportunity_times = OpportunityTime.all
  end

  # GET /opportunity_times/1
  # GET /opportunity_times/1.json
  def show
  end

  # GET /opportunity_times/new
  def new
    @opportunity_time = OpportunityTime.new
  end

  # GET /opportunity_times/1/edit
  def edit
  end

  # POST /opportunity_times
  # POST /opportunity_times.json
  def create
    @opportunity_time = OpportunityTime.new(opportunity_time_params)

    respond_to do |format|
      if @opportunity_time.save
        format.html { redirect_to @opportunity_time, notice: 'Opportunity time was successfully created.' }
        format.json { render :show, status: :created, location: @opportunity_time }
      else
        format.html { render :new }
        format.json { render json: @opportunity_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /opportunity_times/1
  # PATCH/PUT /opportunity_times/1.json
  def update
    respond_to do |format|
      if @opportunity_time.update(opportunity_time_params)
        format.html { redirect_to @opportunity_time, notice: 'Opportunity time was successfully updated.' }
        format.json { render :show, status: :ok, location: @opportunity_time }
      else
        format.html { render :edit }
        format.json { render json: @opportunity_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /opportunity_times/1
  # DELETE /opportunity_times/1.json
  def destroy
    @opportunity_time.destroy
    respond_to do |format|
      format.html { redirect_to opportunity_times_url, notice: 'Opportunity time was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_opportunity_time
      @opportunity_time = OpportunityTime.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def opportunity_time_params
      params.require(:opportunity_time).permit(:time, :date, :day, :frequency, :opportunity_id)
    end
end
