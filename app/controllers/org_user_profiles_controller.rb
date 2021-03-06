class OrgUserProfilesController < ApplicationController
  before_action :set_org_user_profile, only: [:show, :edit, :update, :destroy, :approve, :prohibit, :resend_register_admin_mailer, :resend_register_user_mailer]
  # skip_before_action :check_admin, except: [:show]

  # This function is for admin user only, to approve a host to appear in MOBEEAS website
  # This function is called from the prohibited hosts page and will redirect to the same page after a host is approved.
  def approve
    @org_user_profile.approved = true
    @org_user_profile.save!
    redirect_to org_user_profiles_path(status: 'prohibited')
  end

  # This function is for admin user only, to prohibit a host to appear in MOBEEAS website
  # This function is called from the list of approved hosts page and will redirect to the same page after a host is prohibited.
  def prohibit
    @org_user_profile.approved = false
    @org_user_profile.save!
    redirect_to org_user_profiles_path(status: 'approved')
  end

  def resend_register_admin_mailer(organisation_id, org_user_profile)
    @organisation = Organisation.find(organisation_id)
    @org_user_profile = org_user_profile
    NewOrgUserProfileMailer.register_admin(@organisation.id, @org_user_profile.user.id).deliver_now
  end

  def resend_register_user_mailer(organisation_id)
    @organisation = Organisation.find(organisation_id)
    NewOrgUserProfileMailer.register_user(@organisation.id, current_user.id).deliver_now
  end

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
    if params[:org_id].present?
      @organisation = Organisation.find(params[:org_id])
    end 
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
        if @org_user_profile.agency == 'organisation host'
          if params[:org_id].present?
            @organisation = Organisation.find(params[:org_id])
            #this is when the organisation is new and the first Admin host profile is created
            if (@organisation.users.count <= 1) #the org has only one Admin Host
              if (@organisation.users.first == current_user)#check if the first Admin Host is the same with the current user, a new mail to org's exec will be sent for approval
                NewOrganisationMailer.register_admin(@organisation.id, current_user.id).deliver_now
                NewOrgUserProfileMailer.new_organisation_host(@organisation.id, current_user.id).deliver_now
              else
                @organisation.users << current_user #if the current user is not the same as the first Admin Host, add it to the org
                NewOrgUserProfileMailer.new_organisation_host(@organisation.id, current_user.id).deliver_now
              end
            else # if the @organisation has more than one users already
              @organisation.users << current_user #if the current user is not the same as the first Admin Host, add it to the org
              NewOrgUserProfileMailer.new_organisation_host(@organisation.id, current_user.id).deliver_now
            end

          end
          if params[:is_admin].present?
            if (params[:is_admin] == 'yes') # if params is_admin is true
              current_user.org_users.each do |org_user|
                if (org_user.user_id == current_user.id) && (org_user.organisation_id == @organisation)
                  org_user.admin_status = true
                  org_user.save!
                end
              end # end of loop
              NewOrgUserProfileMailer.register_admin(@organisation.id, current_user.id).deliver_now
            elsif (params[:is_admin] == 'no')
              NewOrgUserProfileMailer.register_user(@organisation.id, current_user.id).deliver_now
            end # end of if params[:is_admin]
            current_user.save!
          end # end if params[:is_admin].present?

          if @organisation.present? # if no organisation is ever created or if the host does not have any organisation attached to it.
            format.html { redirect_to host_profile_path, notice: 'Organisation host was successfully created.' }
            format.json { render :show, status: :created, location: @org_user_profile }
          else
            format.html { redirect_to new_organisation_path(subs_type: 'new_org'), notice: 'Organisation host was successfully created.' }
            format.json { render :show, status: :created, location: @org_user_profile }
          end

        elsif @org_user_profile.agency == 'independent host'
          NewOrgUserProfileMailer.new_independent_host(current_user.id).deliver_now # send message to MOBEEAS Admin
          format.html { redirect_to host_profile_path, notice: 'Independent Host was successfully created.' }
          format.json { render :show, status: :created, location: @org_user_profile }
        end
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
        # format.html { redirect_to @org_user_profile } ### the original code
        format.html { redirect_to host_profile_path }
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
      params.require(:org_user_profile).permit(:first_name, :last_name, :phone, :position, :guid, :user_id, :org_creator, :connections, :agency, :number_of_tokens_for_independent, :approved, :suburb, :state, :postcode, :country, :dob)
    end


end
