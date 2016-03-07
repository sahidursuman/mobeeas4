class TokenPurchasesController < ApplicationController
  before_action :set_token_purchase, only: [:show, :edit, :update, :destroy]

  # GET /token_purchases
  # GET /token_purchases.json
  def index
    @token_purchases = TokenPurchase.all
  end

  # GET /token_purchases/1
  # GET /token_purchases/1.json
  def show
  end

  # GET /token_purchases/new
  def new
    @token_purchase = TokenPurchase.new
    if params[:org]
      @organisation = Organisation.find(params[:org])
    end
    if params[:token_pack]
      @token_pack = EngagementTokenPack.find(params[:token_pack])
    end
  end

  # GET /token_purchases/1/edit
  def edit
  end

  # POST /token_purchases
  # POST /token_purchases.json
  def create
    @token_purchase = TokenPurchase.new(token_purchase_params)

    respond_to do |format|
      if @token_purchase.save
        format.html { redirect_to @token_purchase, notice: 'Token purchase was successfully created.' }
        format.json { render :show, status: :created, location: @token_purchase }
      else
        format.html { render :new }
        format.json { render json: @token_purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /token_purchases/1
  # PATCH/PUT /token_purchases/1.json
  def update
    respond_to do |format|
      if @token_purchase.update(token_purchase_params)
        format.html { redirect_to @token_purchase, notice: 'Token purchase was successfully updated.' }
        format.json { render :show, status: :ok, location: @token_purchase }
      else
        format.html { render :edit }
        format.json { render json: @token_purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /token_purchases/1
  # DELETE /token_purchases/1.json
  def destroy
    @token_purchase.destroy
    respond_to do |format|
      format.html { redirect_to token_purchases_url, notice: 'Token purchase was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_token_purchase
      @token_purchase = TokenPurchase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def token_purchase_params
      params.require(:token_purchase).permit(:user_id, :organisation_id, :number_of_tokens, :payment)
    end
end
