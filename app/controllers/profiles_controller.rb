class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :approve, :prohibit]
  before_action :current_user_profile, only: [:edit, :update, :destroy]

  # This function is for admin user only, to approve a candidate to appear in MOBEEAS website
  # This function is called from the prohibited candidates page and will redirect to the same page after a candidate is approved.
  def approve
    @profile.approved = true
    @profile.save!
    redirect_to profiles_path(status: 'prohibited')
  end

  # This function is for admin user only, to prohibit a candidate to appear in MOBEEAS website
  # This function is called from the list of approved candidates page and will redirect to the same page after a candidate is prohibited.
  def prohibit
    @profile.approved = false
    @profile.save!
    redirect_to profiles_path(status: 'approved')
  end

  # GET /profiles
  # GET /profiles.json
  def index
    if current_user.has_role? :admin
      @profiles = Profile.all
    else
      redirect_to root_path
    end
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    if @profile.user == current_user or current_user.has_role? :admin
      @user = @profile.user
      @candidate_skills = @user.candidate_skills
      @user_skills = @user.skills.includes(:candidate_skills)
      @user_educations = @user.educations
      @user_security_checks = @user.security_checks
      @agreement = @user.agreement
    else
      redirect_to root_path
    end
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user

    respond_to do |format|
      if @profile.save
        current_user.add_role :candidate
        # Send notification to new user that his candidate profile has been created
        RegistrationMailer.registration(@profile.user.id).deliver_now

        # Send notification to MOBEEAS Admin that a new candidate user has been created
        RegistrationMailer.new_user_notification(@profile.user.id).deliver_now

        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    def current_user_profile
      @profile = current_user.profile
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:dob, :candidate_type_id, :user_id, :first_name, :last_name, :picture, :bio, :address, :suburb, :state, :postcode, :country, :phone, :linkedin, :latitude, :longitude, :approved)
    end
end
