class OpportunitiesController < ApplicationController
  before_action :set_opportunity, only: [:status_draft, :status_listed, :post_active, :status_archived, :purchase_more_tokens_for, :contact_candidate_for, :contact_host_for, :show, :edit, :update, :destroy]

  def status_draft
    @opportunity.opportunity_status = 'draft'
    @opportunity.save!
    redirect_to @opportunity
  end

  def status_listed
    @opportunity.opportunity_status = 'listed'
    @opportunity.save!
    redirect_to @opportunity
  end

  def post_active
    @opportunity.opportunity_status = 'post_active'
    @opportunity.save!
    redirect_to @opportunity
  end

  def status_archived
    @opportunity.archived = true
    @opportunity.save!
    redirect_to @opportunity
  end

  def purchase_more_tokens_for
    @user = User.find(params[:user_id])
    OpportunityMailer.purchase_more_tokens(@opportunity.id, @user.id).deliver_now
    redirect_to @opportunity
  end

  def contact_candidate_for
    @profile = Profile.find(params[:profile_id])
    OpportunityMailer.contact_candidate(@opportunity.id, @profile.id).deliver_now
    redirect_to @opportunity
  end

  def contact_host_for
    OpportunityMailer.contact_host(@opportunity.id, params[:user_id]).deliver_now
    redirect_to @opportunity
  end


  # GET /opportunities
  # GET /opportunities.json
  def index
    # @opportunities = Opportunity.all

    if params[:status] == 'draft'
      @opportunities = Opportunity.draft.not_archived

    elsif params[:status] == 'listed'
      @opportunities = Opportunity.listed.not_archived

    elsif params[:status] == 'active'
      @opportunities = Opportunity.active.not_archived

    elsif params[:status] == 'post_active'
      @opportunities = Opportunity.post_active.not_archived

    elsif params[:status] == 'archived'
      @opportunities = Opportunity.archived

    elsif params[:status] == 'sponsored_by_us'
      @opportunities = Opportunity.all
    end
  end

  # def skills
  #   @skills = Skill.all
  # end

  # GET /opportunities/1
  # GET /opportunities/1.json
  def show
    @candidate_skills = CandidateSkill.all
		@engagement_token_packs = EngagementTokenPack.order(price_ex_gst: :asc)
    # @engagement_token_packs = EngagementTokenPack.all

    @host = User.find(@opportunity.user_id)
    if @opportunity.organisation_id.present?
      @organisation = Organisation.find(@opportunity.organisation_id)
    end
  end

  # GET /opportunities/new
  def new
    @opportunity = Opportunity.new
    # @school_years = SchoolYear.all
    @opportunity.school_years = SchoolYear.all
  end

  # GET /opportunities/1/edit
  def edit
    @school_years = SchoolYear.all
    if params[:org_id].present?
      @opportunity.organisation_id = params[:org_id]
    end
    # The @opportunity.organisation_id has to be re-entered otherwise it will disappear and will cause problems
  end

  # POST /opportunities
  # POST /opportunities.json
  def create
    @opportunity = Opportunity.new(opportunity_params)
    # @school_years = SchoolYear.all
    # @opportunity.school_years = SchoolYear.new


    respond_to do |format|
      if @opportunity.save
        format.html { redirect_to @opportunity, notice: 'Opportunity was successfully created.' }
        format.json { render :show, status: :created, location: @opportunity }
      else
        format.html { render :new }
        format.json { render json: @opportunity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /opportunities/1
  # PATCH/PUT /opportunities/1.json
  def update
    respond_to do |format|
      if @opportunity.update(opportunity_params)
        format.html { redirect_to @opportunity, notice: 'Opportunity was successfully updated.' }
        format.json { render :show, status: :ok, location: @opportunity }
      else
        format.html { render :edit }
        format.json { render json: @opportunity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /opportunities/1
  # DELETE /opportunities/1.json
  def destroy
    @opportunity.destroy
    respond_to do |format|
      # format.html { redirect_to opportunities_url, notice: 'Opportunity was successfully destroyed.' }
      format.html { redirect_to host_profile_url, notice: 'Opportunity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_opportunity
      @opportunity = Opportunity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def opportunity_params
      params.require(:opportunity).permit(:organisation_id, :user_id, :opportunity_status, :title, :description, :pay, :paid_engagement, :experiences, :employment_terms, :school_year_ids => [])
    end
end
