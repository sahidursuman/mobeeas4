class OrgUsersController < ApplicationController
  before_action :set_org_user, only: [:verified_and_admin_approved, :verified_host, :show, :edit, :update, :destroy]
	skip_before_action :authenticate_user!, only: [:verified_and_admin_approved, :verified_host]

  def verified_and_admin_approved
    @org_user.update_attributes(admin_status: true, verified_status: true)
    @org_user.save!
    @organisation = Organisation.find(params[:org_id])
    # A mailer will be sent to the new host when he has been approved
    NewOrganisationMailer.notify_verified_admin_host(@organisation.id, @org_user.user.id).deliver_now
    redirect_to thanks_url(type: 'verified_host')
  end

  def verified_host
    @org_user.update_attributes(admin_status: false, verified_status: true)
    @org_user.save!
    @organisation = Organisation.find(params[:org_id])
    NewOrganisationMailer.notify_verified_host(@organisation.id, @org_user.user.id).deliver_now
    redirect_to thanks_url(type: 'verified_host')
  end


  # GET /org_users
  # GET /org_users.json
  def index
    @org_users = OrgUser.all
  end

  # GET /org_users/1
  # GET /org_users/1.json
  def show
  end

  # GET /org_users/new
  def new
    @org_user = OrgUser.new
  end

  # GET /org_users/1/edit
  def edit
  end

  # POST /org_users
  # POST /org_users.json
  def create
    @org_user = OrgUser.new(org_user_params)

    respond_to do |format|
      if @org_user.save
        format.html { redirect_to @org_user, notice: 'Org user was successfully created.' }
        format.json { render :show, status: :created, location: @org_user }
      else
        format.html { render :new }
        format.json { render json: @org_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /org_users/1
  # PATCH/PUT /org_users/1.json
  def update
    respond_to do |format|
      if @org_user.update(org_user_params)
        format.html { redirect_to @org_user, notice: 'Org user was successfully updated.' }
        format.json { render :show, status: :ok, location: @org_user }
      else
        format.html { render :edit }
        format.json { render json: @org_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /org_users/1
  # DELETE /org_users/1.json
  def destroy
    @org_user.destroy
    respond_to do |format|
      format.html { redirect_to org_users_url, notice: 'Org user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_org_user
      @org_user = OrgUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def org_user_params
      params.require(:org_user).permit(:admin_status, :verified_status, :organisation_id, :user_id)
    end
end
