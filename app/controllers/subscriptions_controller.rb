class SubscriptionsController < ApplicationController
  before_action :set_subscription, only: [:show, :edit, :update, :destroy, :notify_expiring]

  # Must declare in the before_action above, this function will send email to
  def notify_expiring
    SubscriptionMailer.notify(@subscription.id).deliver_now
    @subscription.notified_at = Date.today
    @subscription.save!
    if @subscription.user_type == 'organisation'
      redirect_to subscriptions_path(organisation: 'expiring')
    elsif @subscription.user_type == 'independent'
      redirect_to subscriptions_path(independent: 'expiring')
    elsif @subscription.user_type == 'candidate'
      redirect_to subscriptions_path(candidate: 'expiring')
    end
  end

  # GET /subscriptions
  # GET /subscriptions.json
  def index
    # @subscriptions = Subscription.all

    if params[:organisation] == 'active'
      @subscriptions = Subscription.organisation.expiring_in_more_than_30_days

    elsif params[:organisation] == 'expiring'
      @subscriptions = Subscription.organisation.expiring_in_less_than_30_days.are_active

    elsif params[:organisation] == 'expired'
      @subscriptions = Subscription.organisation.are_expired

    elsif params[:independent] == 'active'
      @subscriptions = Subscription.independent.expiring_in_more_than_30_days

    elsif params[:independent] == 'expiring'
      @subscriptions = Subscription.independent.expiring_in_less_than_30_days.are_active

    elsif params[:independent] == 'expired'
      @subscriptions = Subscription.independent.are_expired

    elsif params[:candidate] == 'active'
      @subscriptions = Subscription.candidate.expiring_in_more_than_30_days

    elsif params[:candidate] == 'expiring'
      @subscriptions = Subscription.candidate.expiring_in_less_than_30_days.are_active

    elsif params[:candidate] == 'expired'
      @subscriptions = Subscription.candidate.are_expired

    end
  end

  # GET /subscriptions/1
  # GET /subscriptions/1.json
  def show
  end

  # GET /subscriptions/new
  def new
    @subscription = Subscription.new
    if params[:subscription_pack].present?
      @subscription_pack = SubscriptionPack.find(params[:subscription_pack])
    end
    if params[:org].present?
      @organisation = Organisation.find(params[:org])
    end

  end

  # GET /subscriptions/1/edit
  def edit
    @users = User.all
    @organisations = Organisation.all
  end

  # POST /subscriptions
  # POST /subscriptions.json
  def create
    @subscription = Subscription.new(subscription_params)

    respond_to do |format|
      if @subscription.save
        format.html { redirect_to @subscription, notice: 'Subscription was successfully created.' }
        format.json { render :show, status: :created, location: @subscription }
      else
        format.html { render :new }
        format.json { render json: @subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subscriptions/1
  # PATCH/PUT /subscriptions/1.json
  def update
    respond_to do |format|
      if @subscription.update(subscription_params)
        format.html { redirect_to @subscription, notice: 'Subscription was successfully updated.' }
        format.json { render :show, status: :ok, location: @subscription }
      else
        format.html { render :edit }
        format.json { render json: @subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subscriptions/1
  # DELETE /subscriptions/1.json
  def destroy
    @subscription.destroy
    respond_to do |format|
      format.html { redirect_to subscriptions_url, notice: 'Subscription was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscription
      @subscription = Subscription.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subscription_params
      params.require(:subscription).permit(:user_type, :user_id, :organisation_id, :expiry_date, :payment, :notified_at, :manual_receipt, :notes)
    end
end
