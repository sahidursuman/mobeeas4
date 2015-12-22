class SponsorsController < ApplicationController
  before_action :set_sponsor, only: [:show, :edit, :update, :destroy]

  # GET /sponsors
  # GET /sponsors.json
  def index
    @sponsors = Sponsor.all
  end

  # GET /sponsors/1
  # GET /sponsors/1.json
  def show
  end

  # GET /sponsors/new
  def new
    @sponsor = Sponsor.new
  end

  # GET /sponsors/1/edit
  def edit
  end

  # POST /sponsors
  # POST /sponsors.json
  def create
    @sponsor = Sponsor.new(sponsor_params)
    @sponsor.user_id = current_user.id

    respond_to do |format|
      if @sponsor.save
        current_user.add_role :sponsor
        # Send notification to the new user that his sponsor account has been created.
        RegistrationMailer.registration(@sponsor.user.id).deliver_now

        # Send notification to MOBEEAS Admin that a new sponsor user has been created
        RegistrationMailer.new_user_notification(@sponsor.user.id).deliver_now

        format.html { redirect_to sponsor_page_path, notice: 'Sponsor was successfully created.' }
        format.json { render :show, status: :created, location: @sponsor }
      else
        format.html { render :new }
        format.json { render json: @sponsor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sponsors/1
  # PATCH/PUT /sponsors/1.json
  def update
    respond_to do |format|
      if @sponsor.update(sponsor_params)
        # format.html { redirect_to @sponsor, notice: 'Sponsor was successfully updated.' }
        format.html { redirect_to sponsor_page_path, notice: 'Sponsor was successfully updated.' }
        format.json { render :show, status: :ok, location: @sponsor }
      else
        format.html { render :edit }
        format.json { render json: @sponsor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sponsors/1
  # DELETE /sponsors/1.json
  def destroy
    @sponsor.destroy
    respond_to do |format|
      format.html { redirect_to sponsors_url, notice: 'Sponsor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sponsor
      @sponsor = Sponsor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sponsor_params
      params.require(:sponsor).permit(:first_name, :last_name, :organisation, :position, :phone1, :phone2, :address, :suburb, :state, :postcode, :country, :guid, :user_id, :logo)
    end
end
