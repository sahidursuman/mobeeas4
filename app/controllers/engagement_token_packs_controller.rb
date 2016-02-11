class EngagementTokenPacksController < ApplicationController
  before_action :set_engagement_token_pack, only: [:show, :edit, :update, :destroy]

  # GET /engagement_token_packs
  # GET /engagement_token_packs.json
  def index
    @engagement_token_packs = EngagementTokenPack.all
  end

  # GET /engagement_token_packs/1
  # GET /engagement_token_packs/1.json
  def show
  end

  # GET /engagement_token_packs/new
  def new
    @engagement_token_pack = EngagementTokenPack.new
  end

  # GET /engagement_token_packs/1/edit
  def edit
  end

  # POST /engagement_token_packs
  # POST /engagement_token_packs.json
  def create
    @engagement_token_pack = EngagementTokenPack.new(engagement_token_pack_params)

    respond_to do |format|
      if @engagement_token_pack.save
        format.html { redirect_to income_path, notice: 'Engagement token pack was successfully created.' }
        format.json { render :show, status: :created, location: @engagement_token_pack }

        # Keep this two lines below, only because it is the original code
        # format.html { redirect_to @engagement_token_pack, notice: 'Engagement token pack was successfully created.' }
        # format.json { render :show, status: :created, location: @engagement_token_pack }
      else
        format.html { render :new }
        format.json { render json: @engagement_token_pack.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /engagement_token_packs/1
  # PATCH/PUT /engagement_token_packs/1.json
  def update
    respond_to do |format|
      if @engagement_token_pack.update(engagement_token_pack_params)
          format.html { redirect_to income_path, notice: 'Engagement token pack was successfully updated.' }
          format.json { render :show, status: :ok, location: @engagement_token_pack }
          # Keep this two lines below, only because it is the original code
          # format.html { redirect_to @engagement_token_pack, notice: 'Engagement token pack was successfully updated.' }
          # format.json { render :show, status: :ok, location: @engagement_token_pack }
      else
        format.html { render :edit }
        format.json { render json: @engagement_token_pack.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /engagement_token_packs/1
  # DELETE /engagement_token_packs/1.json
  def destroy
    @engagement_token_pack.destroy
    respond_to do |format|
      format.html { redirect_to income_path, notice: 'Engagement token pack was successfully destroyed.' }
      format.json { head :no_content }

      # Keep this two lines below, only because it is the original code
      # format.html { redirect_to engagement_token_packs_url, notice: 'Engagement token pack was successfully destroyed.' }
      # format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_engagement_token_pack
      @engagement_token_pack = EngagementTokenPack.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def engagement_token_pack_params
      params.require(:engagement_token_pack).permit(:name, :member_price, :number_of_tokens)
    end
end
