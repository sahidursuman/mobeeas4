class OpportunitySchoolYearsController < ApplicationController
  before_action :set_opportunity_school_year, only: [:show, :edit, :update, :destroy]

  # GET /opportunity_school_years
  # GET /opportunity_school_years.json
  def index
    @opportunity_school_years = OpportunitySchoolYear.all
  end

  # GET /opportunity_school_years/1
  # GET /opportunity_school_years/1.json
  def show
  end

  # GET /opportunity_school_years/new
  def new
    @opportunity_school_year = OpportunitySchoolYear.new
  end

  # GET /opportunity_school_years/1/edit
  def edit
  end

  # POST /opportunity_school_years
  # POST /opportunity_school_years.json
  def create
    @opportunity_school_year = OpportunitySchoolYear.new(opportunity_school_year_params)
    @opportunity = Opportunity.find(params[:opportunity_id])
    # @opportunity_school_year.opportunity_id = @opportunity.id

    respond_to do |format|
      if @opportunity_school_year.save
        # the original code
        # format.html { redirect_to @opportunity_school_year, notice: 'Opportunity school year was successfully created.' }

        format.html { redirect_to @opportunity, notice: 'Opportunity school year was successfully created.' }
        format.json { render :show, status: :created, location: @opportunity_school_year }
      else
        format.html { render :new }
        format.json { render json: @opportunity_school_year.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /opportunity_school_years/1
  # PATCH/PUT /opportunity_school_years/1.json
  def update
    @opportunity = Opportunity.find(params[:opportunity_id])
    @opportunity_school_year.opportunity_id = @opportunity.id

    respond_to do |format|
      if @opportunity_school_year.update(opportunity_school_year_params)
        # the original code
        # format.html { redirect_to @opportunity_school_year, notice: 'Opportunity school year was successfully updated.' }

        format.html { redirect_to @opportunity, notice: 'Opportunity school year was successfully updated.' }
        format.json { render :show, status: :ok, location: @opportunity_school_year }
      else
        format.html { render :edit }
        format.json { render json: @opportunity_school_year.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /opportunity_school_years/1
  # DELETE /opportunity_school_years/1.json
  def destroy
    @opportunity = Opportunity.find(params[:opportunity_id])
    @opportunity_school_year.destroy
    respond_to do |format|
      format.html { redirect_to @opportunity, notice: 'Opportunity school year was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_opportunity_school_year
      @opportunity_school_year = OpportunitySchoolYear.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def opportunity_school_year_params
      params.require(:opportunity_school_year).permit(:opportunity_id, :school_year_id, :number_of_students)
    end
end
