class CandidateTypesController < ApplicationController
  before_action :set_candidate_type, only: [:show, :edit, :update, :destroy]

  # GET /candidate_types
  # GET /candidate_types.json
  def index
    @candidate_types = CandidateType.all
  end

  # GET /candidate_types/1
  # GET /candidate_types/1.json
  def show
  end

  # GET /candidate_types/new
  def new
    @candidate_type = CandidateType.new
  end

  # GET /candidate_types/1/edit
  def edit
  end

  # POST /candidate_types
  # POST /candidate_types.json
  def create
    @candidate_type = CandidateType.new(candidate_type_params)

    respond_to do |format|
      if @candidate_type.save
        format.html { redirect_to @candidate_type, notice: 'Candidate type was successfully created.' }
        format.json { render :show, status: :created, location: @candidate_type }
      else
        format.html { render :new }
        format.json { render json: @candidate_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /candidate_types/1
  # PATCH/PUT /candidate_types/1.json
  def update
    respond_to do |format|
      if @candidate_type.update(candidate_type_params)
        format.html { redirect_to @candidate_type, notice: 'Candidate type was successfully updated.' }
        format.json { render :show, status: :ok, location: @candidate_type }
      else
        format.html { render :edit }
        format.json { render json: @candidate_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /candidate_types/1
  # DELETE /candidate_types/1.json
  def destroy
    @candidate_type.destroy
    respond_to do |format|
      format.html { redirect_to candidate_types_url, notice: 'Candidate type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_candidate_type
      @candidate_type = CandidateType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def candidate_type_params
      params.require(:candidate_type).permit(:name, :description)
    end
end
