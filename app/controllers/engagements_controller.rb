class EngagementsController < ApplicationController
  before_action :set_engagement, only: [:show, :edit, :update, :destroy]

  # Wed, 6 April 2016: This function refers to the candidate_engagement_v2.html.erb
  # To be kept for reference only, def name above has been removed, DO NOT USE IT-----------------------.
  # def invite
  #   @engagement.update_attributes(status: "invited")
  #   @opportunity = Opportunity.find(params[:opportunity_id])
  #   OpportunityMailer.invited(params[:opportunity_id], params[:profile_id]).deliver_now
  #   redirect_to @opportunity
  # end

  # Wed, 6 April 2016: This function refers to the candidate_engagement_v2.html.erb
  # To be kept for reference only, def name above has been removed, DO NOT USE IT-----------------------.
  # def accept
  #   @engagement.update_attributes(status: "accepted")
  #   @opportunity = Opportunity.find(params[:opportunity_id])
  #   @opportunity.opportunity_status = 'active'
  #   @opportunity.save!
  #   OpportunityMailer.accepted(params[:opportunity_id], params[:profile_id]).deliver_now
  #   redirect_to @opportunity
  # end

  # Wed, 6 April 2016: This function refers to the candidate_engagement_v2.html.erb
  # To be kept for reference only, def name above has been removed, DO NOT USE IT-----------------------.
  # def apply_a_token_to
  #   @opportunity = Opportunity.find(params[:opportunity_id])
  #   if (@opportunity.user.org_user_profile.agency == 'organisation host')
  #     @opportunity.organisation.number_of_tokens -= 1 # reduce a token from organisation
  #   elsif (@opportunity.user.org_user_profile.agency == 'independent host')
  #     @opportunity.user.org_user_profile.number_of_tokens_for_independent -= 1 # reduce a token from the host's own token
  #   end
  #   if !(@opportunity.opportunity_status == 'active')
  #     @opportunity.opportunity_status = 'active'
  #   end
  #   @opportunity.save!
  #   OpportunityMailer.assigned_a_token(params[:opportunity_id], params[:profile_id]).deliver_now
  #   redirect_to @opportunity
  # end

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
    @opportunity = Opportunity.find(params[:opp_id])
    @candidate = Profile.find(params[:profile_id])

    respond_to do |format|
      if @engagement.save
        if (@opportunity.user.org_user_profile.agency == 'organisation host')
          @organisation = Organisation.find(@opportunity.organisation.id)
          @organisation.number_of_tokens -= 1 # reduce a token from organisation
          @organisation.save!
        elsif (@opportunity.user.org_user_profile.agency == 'independent host')
          @org_user_profile = OrgUserProfile.find(@opportunity.user.org_user_profile.id)
          @org_user_profile.number_of_tokens_for_independent -= 1 # reduce a token from the host's own token
          @org_user_profile.save!
        end
        if !(@opportunity.opportunity_status == 'active')
          @opportunity.update_attributes(opportunity_status: 'active')
        end
        OpportunityMailer.assigned_a_token(@opportunity.id, @candidate.id).deliver_now
        format.html { redirect_to @opportunity, notice: 'Engagement was successfully created.' }
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
      params.require(:engagement).permit(:opportunity_id, :profile_id, :progress_report_ids, :completion_report_ids)
    end
end
