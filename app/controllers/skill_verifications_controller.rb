class SkillVerificationsController < ApplicationController
  before_action :set_skill_verification, only: [:show, :approve, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:show, :update]

# Ask Pete what is the purpose of this function.
# What does approve attribute signify ?
  def approve
    if current_user.has_role? :admin
      @skill_verification.update_attributes(approve: true)
      redirect_to skill_verifications_path
    else
      redirect_to root_path
    end
  end
  # GET /skill_verifications
  # GET /skill_verifications.json
  def index
    if current_user.has_role? :admin
      @skill_verifications = SkillVerification.all
    else
      redirect_to root_path
    end
  end

  # GET /skill_verifications/1
  # GET /skill_verifications/1.json
  def show
    # @skill_verification = SkillVerification.find_by(guid: params[:id])
    byebug
    @candidate_skills = @skill_verification.candidate_skills
    byebug
  end

  # GET /skill_verifications/new
  def new
    @skill_verification = SkillVerification.new
  end

  # GET /skill_verifications/1/edit
  def edit
    unless current_user.has_role? :admin
      redirect_to root_path
    end
  end

  # POST /skill_verifications
  # POST /skill_verifications.json
  def create
    @skill_verification = SkillVerification.new(skill_verification_params)
    @skill_verification.user = current_user
    respond_to do |format|
      if @skill_verification.save
        SkillVerificationMailer.verify(@skill_verification.id).deliver_now
        format.html { redirect_to profile_path(current_user.profile), notice: 'Skill verification was successfully created.' }
        format.json { render :show, status: :created, location: @skill_verification }
      else
        format.html { render :new }
        format.json { render json: @skill_verification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /skill_verifications/1
  # PATCH/PUT /skill_verifications/1.json
  def update
    respond_to do |format|
      if @skill_verification.update(skill_verification_params)
        @skill_verification.candidate_skills.each do |candidate_skill|
          # if the referee chose any skill level for this candidate (not blank), then verified is true.
          if !(candidate_skill.skill_level.blank?)
            candidate_skill.verified = true
          end
          @skill_verification.save! # must save the update
        end # end of loop

        SkillVerificationMailer.approve(@skill_verification.id).deliver_now
        format.html { redirect_to thanks_path(type: 'skill-verification'), notice: 'Skill verification was successfully updated.' }
        format.json { render :show, status: :ok, location: @skill_verification }
      else
        format.html { render :edit }
        format.json { render json: @skill_verification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /skill_verifications/1
  # DELETE /skill_verifications/1.json
  def destroy
    @skill_verification.destroy
    respond_to do |format|
      format.html { redirect_to skill_verifications_url, notice: 'Skill verification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_skill_verification
      @skill_verification = SkillVerification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def skill_verification_params
      params.require(:skill_verification).permit(:user_id, :referree_name, :referree_email, :referree_phone, :work_ethic, :communication, :presentation, :accomplishments, :message, :referree_relationship => [], :time_known => [], :candidate_skill_ids => [], :candidate_skills_attributes => [:id, :skill_level])
    end
end
