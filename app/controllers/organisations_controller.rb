class OrganisationsController < ApplicationController
  before_action :set_organisation, only: [:remove_host_from, :add_admin_into, :add_host_into, :show, :edit, :update, :destroy]
  # skip_before_action :check_admin, except: [:index, :show]
  skip_before_action :check_admin, except: [:show]

  # if a host decides to remove his connection to this organisation
  def remove_host_from
    user = User.find(params[:user_id])
    @organisation.users.delete(user)
    redirect_to @organisation
  end

  def add_admin_into
    user = User.find(params[:user_id])
    @organisation.users << user
    NewOrgUserProfileMailer.notify(@organisation.id, user.id).deliver_now
    NewOrgUserProfileMailer.register_admin(@organisation.id, user.id).deliver_now
    redirect_to @organisation
  end

  def add_host_into
    user = User.find(params[:user_id])
    @organisation.users << user
    NewOrgUserProfileMailer.notify(@organisation.id, user.id).deliver_now
    NewOrgUserProfileMailer.register_user(@organisation.id, user.id).deliver_now
    redirect_to @organisation
  end

  # GET /organisations
  # GET /organisations.json
  def index
    @organisations = Organisation.paginate(:page => params[:page], :per_page => 5)
    if params[:search]
      @organisations = Organisation.search(params[:search]).order("name DESC").paginate(:page => params[:page], :per_page => 5)
    else
      @organisations = Organisation.order("name DESC").paginate(:page => params[:page], :per_page => 5)
    end
  end

  # GET /organisations/1
  # GET /organisations/1.json
  def show
  end

  # GET /organisations/new
  def new
    @organisation = Organisation.new
  end

  # GET /organisations/1/edit
  def edit
  end

  # POST /organisations
  # POST /organisations.json
  def create
    @organisation = Organisation.new(organisation_params)
    @organisation.users << current_user
    respond_to do |format|
      if @organisation.save
        NewOrganisationMailer.notify(@organisation.id).deliver_now
        NewOrganisationMailer.register_admin(@organisation.id, current_user.id).deliver_now
        format.html { redirect_to @organisation, notice: 'Organisation was successfully created.' }
        format.json { render :show, status: :created, location: @organisation }
      else
        format.html { render :new }
        format.json { render json: @organisation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organisations/1
  # PATCH/PUT /organisations/1.json
  def update
    respond_to do |format|
      if @organisation.update(organisation_params)
        format.html { redirect_to @organisation, notice: 'Organisation was successfully updated.' }
        format.json { render :show, status: :ok, location: @organisation }
      else
        format.html { render :edit }
        format.json { render json: @organisation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organisations/1
  # DELETE /organisations/1.json
  def destroy
    @organisation.destroy
    respond_to do |format|
      format.html { redirect_to organisations_url, notice: 'Organisation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organisation
      @organisation = Organisation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def organisation_params
      params.require(:organisation).permit(:organisation_type_id, :name, :contact_name, :contact_email, :contact_phone, :address, :suburb, :state, :postcode, :country, :logo, :website, :acara_school_id, :school_type, :latitude, :longitude)
    end
end
