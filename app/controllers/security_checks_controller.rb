class SecurityChecksController < ApplicationController
  before_action :set_security_check, only: [:show, :edit, :update, :destroy, :verify_candidate]
  skip_before_action :check_admin, except: [:index, :show]


  def verify_candidate
    @security_check.verify(params[:checked_by])
    redirect_to unverified_wwc_path
  end

  # GET /security_checks
  # GET /security_checks.json
  def index
    @security_checks = SecurityCheck.all
  end

  # GET /security_checks/1
  # GET /security_checks/1.json
  def show
  end

  # GET /security_checks/new
  def new
    @security_check = SecurityCheck.new
  end

  # GET /security_checks/1/edit
  def edit
  end

  # POST /security_checks
  # POST /security_checks.json
  def create
    @security_check = SecurityCheck.new(security_check_params)
    @security_check.user = current_user
    respond_to do |format|
      if @security_check.save
        if current_user.has_role? :host
          format.html { redirect_to org_user_profile_path(current_user.org_user_profile), notice: 'Security check was successfully created.' }
          format.json { render :show, status: :created, location: @security_check }
        elsif current_user.has_role? :candidate
          format.html { redirect_to profile_path(current_user.profile), notice: 'Security check was successfully created.' }
          format.json { render :show, status: :created, location: @security_check }
        end
      else
        format.html { render :new }
        format.json { render json: @security_check.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /security_checks/1
  # PATCH/PUT /security_checks/1.json
  def update
    respond_to do |format|
      if params[:admin_check] # this is coming from unverified_wwc page
        @security_check.update(security_check_params)
        format.html { redirect_to unverified_wwc_path, notice: 'Security check was successfully updated.' }
        format.json { render :show, status: :ok, location: @security_check }
      elsif !(params[:admin_check].present?)
        @security_check.update(security_check_params)
        format.html { redirect_to profile_path(current_user.profile), notice: 'Security check was successfully updated.' }
        format.json { render :show, status: :ok, location: @security_check }

      # Original format -- DO NOT DELETE
      # if @security_check.update(security_check_params)
      #   format.html { redirect_to profile_path(current_user.profile), notice: 'Security check was successfully updated.' }
      #   format.json { render :show, status: :ok, location: @security_check }
      else
        format.html { render :edit }
        format.json { render json: @security_check.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /security_checks/1
  # DELETE /security_checks/1.json
  def destroy
    @security_check.destroy
    respond_to do |format|
      format.html { redirect_to security_checks_url, notice: 'Security check was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_security_check
      @security_check = SecurityCheck.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def security_check_params
      params.require(:security_check).permit(:name, :state, :number, :expiry_date, :checked, :checked_by, :user_id, :verification_code)
    end
end
