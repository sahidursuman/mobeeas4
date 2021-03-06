class ExpressionOfInterestsController < ApplicationController
  before_action :set_expression_of_interest, only: [:show, :edit, :update, :destroy, :approve]

  def notify
    @eoi = ExpressionOfInterest.create(sponsor_id: params[:sponsor_id], opportunity_id: params[:opportunity_id])
    if @eoi.save
      SponsorshipMailer.expression_of_interest(params[:sponsor_id], params[:opportunity_id]).deliver_now
    end
    redirect_to thanks_path(type: 'expression_of_interest')
  end

  def approve
    @expression_of_interest.approved = true
    if @expression_of_interest.save
      SponsorshipMailer.approved(params[:sponsor_id], params[:opportunity_id]).deliver_now
    end
    redirect_to expression_of_interests_path(status: "pending")
  end

  # GET /expression_of_interests
  # GET /expression_of_interests.json
  def index
    @expression_of_interests = ExpressionOfInterest.all
  end

  # GET /expression_of_interests/1
  # GET /expression_of_interests/1.json
  def show
  end

  # GET /expression_of_interests/new
  def new
    @expression_of_interest = ExpressionOfInterest.new
  end

  # GET /expression_of_interests/1/edit
  def edit
  end

  # POST /expression_of_interests
  # POST /expression_of_interests.json
  def create
    @expression_of_interest = ExpressionOfInterest.new(expression_of_interest_params)

    respond_to do |format|
      if @expression_of_interest.save
        format.html { redirect_to @expression_of_interest, notice: 'Expression of interest was successfully created.' }
        format.json { render :show, status: :created, location: @expression_of_interest }
      else
        format.html { render :new }
        format.json { render json: @expression_of_interest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expression_of_interests/1
  # PATCH/PUT /expression_of_interests/1.json
  def update
    respond_to do |format|
      if @expression_of_interest.update(expression_of_interest_params)
        format.html { redirect_to @expression_of_interest, notice: 'Expression of interest was successfully updated.' }
        format.json { render :show, status: :ok, location: @expression_of_interest }
      else
        format.html { render :edit }
        format.json { render json: @expression_of_interest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expression_of_interests/1
  # DELETE /expression_of_interests/1.json
  def destroy
    @expression_of_interest.destroy
    respond_to do |format|
      # do not delete this original format:
      # format.html { redirect_to expression_of_interests_url, notice: 'Expression of interest was successfully destroyed.' }
      if params[:status] == 'pending'
        format.html { redirect_to expression_of_interests_path(status: "pending"), notice: 'Expression of interest was successfully destroyed.' }
      elsif params[:status] == 'approved'
        format.html { redirect_to expression_of_interests_path(status: "approved"), notice: 'Expression of interest was successfully destroyed.' }
      end
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expression_of_interest
      @expression_of_interest = ExpressionOfInterest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expression_of_interest_params
      params.require(:expression_of_interest).permit(:sponsor_id, :opportunity_id, :approved)
    end
end
