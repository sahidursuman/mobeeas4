class OrgUsersController < ApplicationController
  before_action :set_org_user, only: [:verified_and_admin_approved, :show, :edit, :update, :destroy]
	skip_before_action :authenticate_user!, only: [:verified_and_admin_approved]

  def verified_and_admin_approved
    @org_user.update_attributes(admin_status: true, verified_status: true)
    @organisation = Organisation.find(params[:org_id])
    redirect_to thanks2_url
  end

  def verified_user
    # to be created
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
