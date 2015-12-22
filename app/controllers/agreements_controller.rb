class AgreementsController < ApplicationController
  before_action :set_agreement, only: [:agree_to, :show, :edit, :update, :destroy]

  def agree_to
    if params[:agreement_type] == 'ethics'
      @agreement.update_attributes(ethics: true)
    elsif params[:agreement_type] == 'code_of_conduct'
      @agreement.update_attributes(code_of_conduct: true)
    elsif params[:agreement_type] == 'candidate_terms'
      @agreement.update_attributes(candidate_terms: true)
    elsif params[:agreement_type] == 'host_terms'
      @agreement.update_attributes(host_terms: true)
    elsif params[:agreement_type] == 'sponsor_terms'
      @agreement.update_attributes(sponsor_terms: true)
    end
    redirect_to :back
  end
  # GET /agreements
  # GET /agreements.json
  def index
    @agreements = Agreement.all
  end

  # GET /agreements/1
  # GET /agreements/1.json
  def show
  end

  # GET /agreements/new
  def new
    @agreement = Agreement.new
  end

  # GET /agreements/1/edit
  def edit
  end

  # POST /agreements
  # POST /agreements.json
  def create
    @agreement = Agreement.new(agreement_params)

    respond_to do |format|
      if @agreement.save
        format.html { redirect_to @agreement, notice: 'Agreement was successfully created.' }
        format.json { render :show, status: :created, location: @agreement }
      else
        format.html { render :new }
        format.json { render json: @agreement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /agreements/1
  # PATCH/PUT /agreements/1.json
  def update
    respond_to do |format|
      if @agreement.update(agreement_params)
        format.html { redirect_to @agreement, notice: 'Agreement was successfully updated.' }
        format.json { render :show, status: :ok, location: @agreement }
      else
        format.html { render :edit }
        format.json { render json: @agreement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agreements/1
  # DELETE /agreements/1.json
  def destroy
    @agreement.destroy
    respond_to do |format|
      format.html { redirect_to agreements_url, notice: 'Agreement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agreement
      @agreement = Agreement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def agreement_params
      params.require(:agreement).permit(:user_id, :ethics, :code_of_conduct, :candidate_terms, :host_terms, :sponsor_terms)
    end
end
