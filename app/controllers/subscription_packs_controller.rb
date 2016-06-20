class SubscriptionPacksController < ApplicationController
  before_action :set_subscription_pack, only: [:show, :edit, :update, :destroy]
  before_filter :correct_user
  before_filter :admin_user

  # This function is called from app/views/pages/income.html.erb
  def update_gst_rate_for
    SubscriptionPack.update_all(gst_rate: params[:update_gst_rate])
    redirect_to income_path
  end

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
        format.html { redirect_to income_path, notice: 'Subscription pack was successfully created.' }
        format.json { render :show, status: :created, location: @subscription_pack }

        # Keep this two lines below, only because it is the original code
        # format.html { redirect_to @subscription_pack, notice: 'Subscription pack was successfully created.' }
        # format.json { render :show, status: :created, location: @subscription_pack }
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
        format.html { redirect_to income_path, notice: 'Subscription pack was successfully updated.' }
        format.json { render :show, status: :ok, location: @subscription_pack }

        # Keep this two lines below, only because it is the original code
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
      format.html { redirect_to income_path, notice: 'Subscription pack was successfully destroyed.' }
      format.json { head :no_content }

      # Keep this two lines below, only because it is the original code
      # format.html { redirect_to subscription_packs_url, notice: 'Subscription pack was successfully destroyed.' }
      # format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscription_pack
      @subscription_pack = SubscriptionPack.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subscription_pack_params
      params.require(:subscription_pack).permit(:name, :price_ex_gst, :gst_rate)
    end

    def correct_user
      redirect_to(root_path) if current_user.nil?  && (!current_user.has_role? :admin)
    end

    def admin_user
      redirect_to(root_path) unless (current_user.has_role? :admin)
    end
end
