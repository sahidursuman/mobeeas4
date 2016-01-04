class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  # GET /messages
  # GET /messages.json
  def index
    if params[:my_id] || params[:sender_id]
      @messages = Message.all
    end
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
    @receiver = User.find(params[:to])
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)
    if params[:from].present?
      @message.from = params[:from]
    end

    if params[:to].present?
      @message.to = params[:to]
    end

    if params[:opportunity_id].present?
      @message.opportunity_id = params[:opportunity_id]
    end

    respond_to do |format|
      if @message.save
        # send message by email to recipient
        MessagesMailer.notify(@message.id).deliver_now
        if params[:opportunity_id].present?
          @opportunity = Opportunity.find(params[:opportunity_id])
          format.html { redirect_to @opportunity, notice: 'Message was successfully created.' }
          format.json { render :show, status: :created, location: @opportunity }
        else
          format.html { redirect_to host_profile_path, notice: 'Message was successfully created.' }
          format.json { render :show, status: :created, location: @message }
          # format.html { redirect_to @message, notice: 'Message was successfully created.' } # the original
          # format.json { render :show, status: :created, location: @message }  # the original
        end
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:user_id, :opportunity_id, :message_text, :status, :attachment, :from, :to)
    end
end
