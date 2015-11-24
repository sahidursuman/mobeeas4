class EngagementsController < ApplicationController
  before_action :set_engagement, only: [:short_list, :invite, :accept, :show, :edit, :update, :destroy]


  def short_list
    @engagement.update_attributes(status: "short_listed")
    @opportunity = Opportunity.find(params[:opportunity_id])
    redirect_to @opportunity
  end

  def invite
    @engagement.update_attributes(status: "invited")
    @opportunity = Opportunity.find(params[:opportunity_id])
    redirect_to @opportunity
  end

  def accept
    @engagement.update_attributes(status: "accepted")
    @opportunity = Opportunity.find(params[:opportunity_id])
    @opportunity.opportunity_status = 'active'
    @opportunity.save!
    redirect_to @opportunity
  end

  # GET /engagements
  # GET /engagements.json
  def index
    @engagements = Engagement.all
  end

  # GET /engagements/1
  # GET /engagements/1.json
  def show
  end

  # GET /engagements/new
  def new
    @engagement = Engagement.new
  end

  # GET /engagements/1/edit
  def edit
  end

  # POST /engagements
  # POST /engagements.json
  def create
    @engagement = Engagement.new(engagement_params)

    respond_to do |format|
      if @engagement.save
        format.html { redirect_to @engagement, notice: 'Engagement was successfully created.' }
        format.json { render :show, status: :created, location: @engagement }
      else
        format.html { render :new }
        format.json { render json: @engagement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /engagements/1
  # PATCH/PUT /engagements/1.json
  def update
    respond_to do |format|
      if @engagement.update(engagement_params)
        format.html { redirect_to @engagement, notice: 'Engagement was successfully updated.' }
        format.json { render :show, status: :ok, location: @engagement }
      else
        format.html { render :edit }
        format.json { render json: @engagement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /engagements/1
  # DELETE /engagements/1.json
  def destroy
    @engagement.destroy
    @opportunity = Opportunity.find(params[:opportunity_id])
    respond_to do |format|
      format.html { redirect_to @opportunity, notice: 'Engagement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_engagement
      @engagement = Engagement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def engagement_params
      params.require(:engagement).permit(:opportunity_id, :profile_id, :status)
    end
end
