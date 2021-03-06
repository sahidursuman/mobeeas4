class EducationsController < ApplicationController
  before_action :set_education, only: [:show, :edit, :update, :destroy, :verify_candidate]
  skip_before_action :check_admin, except: [:index, :show]


  def verify_candidate
    if @education.verify
      EducationMailer.approved_by_admin(@education.id).deliver_now
    end
    redirect_to unverified_education_path
  end

  # GET /educations
  # GET /educations.json
  def index
    @educations = Education.all
  end

  # GET /educations/1
  # GET /educations/1.json
  def show
  end

  # GET /educations/new
  def new
    @education = Education.new
  end

  # GET /educations/1/edit
  def edit

  end

  # POST /educations
  # POST /educations.json
  def create
    @education = Education.new(education_params)
    @education.user = current_user
    respond_to do |format|
      if @education.save
        EducationMailer.notify(@education.id).deliver_now
        format.html { redirect_to profile_path(current_user.profile), notice: 'Education was successfully created.' }
        format.json { render :show, status: :created, location: @education }
      else
        format.html { render :new }
        format.json { render json: @education.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /educations/1
  # PATCH/PUT /educations/1.json
  def update
    respond_to do |format|
      if @education.update(education_params)
        format.html { redirect_to profile_path(current_user.profile), notice: 'Education was successfully updated.' }
        format.json { render :show, status: :ok, location: @education }
      else
        format.html { render :edit }
        format.json { render json: @education.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /educations/1
  # DELETE /educations/1.json
  def destroy
    @education.destroy
    respond_to do |format|
      format.html { redirect_to profile_path(current_user.profile), notice: 'Education was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_education
      @education = Education.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def education_params
      params.require(:education).permit(:terms, :user_id, :institution, :course, :year_completed, :achievement)
    end
end
