class OrganisationTypesController < ApplicationController
  before_action :set_organisation_type, only: [:show, :edit, :update, :destroy]

  # GET /organisation_types
  # GET /organisation_types.json
  def index
    @organisation_types = OrganisationType.all
  end

  # GET /organisation_types/1
  # GET /organisation_types/1.json
  def show
  end

  # GET /organisation_types/new
  def new
    @organisation_type = OrganisationType.new
  end

  # GET /organisation_types/1/edit
  def edit
  end

  # POST /organisation_types
  # POST /organisation_types.json
  def create
    @organisation_type = OrganisationType.new(organisation_type_params)

    respond_to do |format|
      if @organisation_type.save
        format.html { redirect_to @organisation_type, notice: 'Organisation type was successfully created.' }
        format.json { render :show, status: :created, location: @organisation_type }
      else
        format.html { render :new }
        format.json { render json: @organisation_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organisation_types/1
  # PATCH/PUT /organisation_types/1.json
  def update
    respond_to do |format|
      if @organisation_type.update(organisation_type_params)
        format.html { redirect_to @organisation_type, notice: 'Organisation type was successfully updated.' }
        format.json { render :show, status: :ok, location: @organisation_type }
      else
        format.html { render :edit }
        format.json { render json: @organisation_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organisation_types/1
  # DELETE /organisation_types/1.json
  def destroy
    @organisation_type.destroy
    respond_to do |format|
      format.html { redirect_to organisation_types_url, notice: 'Organisation type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organisation_type
      @organisation_type = OrganisationType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def organisation_type_params
      params.require(:organisation_type).permit(:name, :description)
    end
end
