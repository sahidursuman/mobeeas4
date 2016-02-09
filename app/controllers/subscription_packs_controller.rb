class SubscriptionPacksController < ApplicationController
  before_action :set_subscription_pack, only: [:show, :edit, :update, :destroy]

  # GET /subscription_packs
  # GET /subscription_packs.json
  def index
    @subscription_packs = SubscriptionPack.all
  end

  # GET /subscription_packs/1
  # GET /subscription_packs/1.json
  def show
  end

  # GET /subscription_packs/new
  def new
    @subscription_pack = SubscriptionPack.new
  end

  # GET /subscription_packs/1/edit
  def edit
  end

  # POST /subscription_packs
  # POST /subscription_packs.json
  def create
    @subscription_pack = SubscriptionPack.new(subscription_pack_params)

    respond_to do |format|
      if @subscription_pack.save
        format.html { redirect_to @subscription_pack, notice: 'Subscription pack was successfully created.' }
        format.json { render :show, status: :created, location: @subscription_pack }
      else
        format.html { render :new }
        format.json { render json: @subscription_pack.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subscription_packs/1
  # PATCH/PUT /subscription_packs/1.json
  def update
    respond_to do |format|
      if @subscription_pack.update(subscription_pack_params)
        format.html { redirect_to @subscription_pack, notice: 'Subscription pack was successfully updated.' }
        format.json { render :show, status: :ok, location: @subscription_pack }
      else
        format.html { render :edit }
        format.json { render json: @subscription_pack.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subscription_packs/1
  # DELETE /subscription_packs/1.json
  def destroy
    @subscription_pack.destroy
    respond_to do |format|
      format.html { redirect_to subscription_packs_url, notice: 'Subscription pack was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscription_pack
      @subscription_pack = SubscriptionPack.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subscription_pack_params
      params.require(:subscription_pack).permit(:name, :price)
    end
end