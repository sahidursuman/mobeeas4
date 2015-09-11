class OpportunityApplicationsController < ApplicationController
  before_action :set_opportunity_application, only: [:show, :edit, :update, :destroy]

  # GET /opportunity_applications
  # GET /opportunity_applications.json
  def index
    @opportunity_applications = OpportunityApplication.all
  end

  # GET /opportunity_applications/1
  # GET /opportunity_applications/1.json
  def show
  end

  # GET /opportunity_applications/new
  def new
    @opportunity_application = OpportunityApplication.new
  end

  # GET /opportunity_applications/1/edit
  def edit
  end

  # POST /opportunity_applications
  # POST /opportunity_applications.json
  def create
    @opportunity_application = OpportunityApplication.new(opportunity_application_params)

    respond_to do |format|
      if @opportunity_application.save
        format.html { redirect_to @opportunity_application, notice: 'Opportunity application was successfully created.' }
        format.json { render :show, status: :created, location: @opportunity_application }
      else
        format.html { render :new }
        format.json { render json: @opportunity_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /opportunity_applications/1
  # PATCH/PUT /opportunity_applications/1.json
  def update
    respond_to do |format|
      if @opportunity_application.update(opportunity_application_params)
        format.html { redirect_to @opportunity_application, notice: 'Opportunity application was successfully updated.' }
        format.json { render :show, status: :ok, location: @opportunity_application }
      else
        format.html { render :edit }
        format.json { render json: @opportunity_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /opportunity_applications/1
  # DELETE /opportunity_applications/1.json
  def destroy
    @opportunity_application.destroy
    respond_to do |format|
      format.html { redirect_to opportunity_applications_url, notice: 'Opportunity application was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_opportunity_application
      @opportunity_application = OpportunityApplication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def opportunity_application_params
      params.require(:opportunity_application).permit(:user_id, :opportunity_id, :introduction, :application_status)
    end
end
