class OrgUserProfilesController < ApplicationController
  before_action :set_org_user_profile, only: [:show, :edit, :update, :destroy]
  # skip_before_action :check_admin, except: [:show]

  # GET /org_user_profiles
  # GET /org_user_profiles.json
  def index
    @org_user_profiles = OrgUserProfile.all
  end

  # GET /org_user_profiles/1
  # GET /org_user_profiles/1.json
  def show
  end

  # GET /org_user_profiles/new
  def new
    @org_user_profile = OrgUserProfile.new
    @organisation = Organisation.find(params[:org_id])
  end

  # GET /org_user_profiles/1/edit
  def edit
  end

  # POST /org_user_profiles
  # POST /org_user_profiles.json
  def create
    @org_user_profile = OrgUserProfile.new(org_user_profile_params)
    @org_user_profile.user_id = current_user.id

    respond_to do |format|
      if @org_user_profile.save
        current_user.add_role :host
        if params[:org_id].present?
          @organisation = Organisation.find(params[:org_id])
          @organisation.users << current_user
        end
        if params[:is_admin].present?
          if (params[:is_admin] == 'yes') # if params is_admin is true
            current_user.org_users.each do |org_user|
              if (org_user.user_id == current_user.id) && (org_user.organisation_id == @organisation)
                org_user.admin_status = true
              end
            end # end of loop
            NewOrgUserProfileMailer.notify(@organisation.id, current_user.id).deliver_now
            NewOrgUserProfileMailer.register_admin(@organisation.id, current_user.id).deliver_now
          else # else if params[:is_admin] == 'no'
            NewOrgUserProfileMailer.notify(@organisation.id, current_user.id).deliver_now
            NewOrgUserProfileMailer.register_user(@organisation.id, current_user.id).deliver_now
          end # end of if params[:is_admin] == 'yes'
          current_user.save!
        end # end if params[:is_admin].present?

        format.html { redirect_to @org_user_profile, notice: 'Organisation host was successfully created.' }
        # format.html { redirect_to :back, notice: 'Org user profile was successfully created.' }
        format.json { render :show, status: :created, location: @org_user_profile }
      else
        format.html { render :new }
        format.json { render json: @org_user_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /org_user_profiles/1
  # PATCH/PUT /org_user_profiles/1.json
  def update
    respond_to do |format|
      if @org_user_profile.update(org_user_profile_params)
        format.html { redirect_to @org_user_profile, notice: 'Org user profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @org_user_profile }
      else
        format.html { render :edit }
        format.json { render json: @org_user_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /org_user_profiles/1
  # DELETE /org_user_profiles/1.json
  def destroy
    @org_user_profile.destroy
    respond_to do |format|
      format.html { redirect_to org_user_profiles_url, notice: 'Org user profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_org_user_profile
      @org_user_profile = OrgUserProfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def org_user_profile_params
      params.require(:org_user_profile).permit(:first_name, :last_name, :phone, :position, :guid, :user_id, :org_creator, :connections)
    end
end
