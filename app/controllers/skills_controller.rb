class SkillsController < ApplicationController
  before_action :set_skill, only: [:add_user, :remove_user, :add_required, :remove_required, :admin_approves_new, :show, :edit, :update, :destroy]
  skip_before_action :check_admin, only: [:add_user, :remove_user, :admin_approves_new]

  def add_user
    @skill.users << current_user
    redirect_to :back
  end

  def remove_user
    @skill.users.delete(current_user)
    redirect_to :back
  end

  def add_required
    @opportunity = Opportunity.find(params[:opportunity_id])
    @skill.opportunities << @opportunity
    redirect_to :back
  end

  def remove_required
    @opportunity = Opportunity.find(params[:opportunity_id])
    @skill.opportunities.delete(@opportunity)
    redirect_to :back
  end

  def admin_approves_new
    @skill.approved = true
    @user = User.find(params[:user_id])

    if @skill.save!
      NewlyAddedSkillMailer.notification_of_approved_new_skill(@skill.id, @user.id).deliver_now
      redirect_to thanks_path(type: 'approved_new_skill', skill_id: @skill.id, user_id: @user.id)
    end
  end

  # GET /skills
  # GET /skills.json
  def index
    @skill_categories = SkillCategory.includes(:skills)
    # @skills = Skill.all
  end

  # GET /skills/1
  # GET /skills/1.json
  def show
  end

  # GET /skills/new
  def new
    @skill = Skill.new
  end

  # GET /skills/1/edit
  def edit
  end

  # POST /skills
  # POST /skills.json
  def create
    @skill = Skill.new(skill_params)
    respond_to do |format|
      if @skill.save
        @candidate_skill = CandidateSkill.create(user_id: current_user.id, skill_id: @skill.id)
        @candidate_skill.save!
        NewlyAddedSkillMailer.approve_new_skill(@skill.id, current_user.id).deliver_now

        # format.html { redirect_to @skill, notice: 'Skill was successfully created.' }
        format.html { redirect_to my_skills_path, notice: 'Skill was successfully created.' }
        format.json { render :show, status: :created, location: @skill }
      else
        format.html { render :new }
        format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /skills/1
  # PATCH/PUT /skills/1.json
  def update
    respond_to do |format|
      if @skill.update(skill_params)
        format.html { redirect_to @skill, notice: 'Skill was successfully updated.' }
        format.json { render :show, status: :ok, location: @skill }
      else
        format.html { render :edit }
        format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /skills/1
  # DELETE /skills/1.json
  def destroy
    @skill.destroy
    respond_to do |format|
      format.html { redirect_to skills_url, notice: 'Skill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private


    # Use callbacks to share common setup or constraints between actions.
    def set_skill
      @skill = Skill.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def skill_params
      params.require(:skill).permit(:skill_category_id, :name, :description, :approved)
    end
end
