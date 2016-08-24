module PagesHelper
  def button_label(pack)
  # This is the original def header, do not delete, for reference
  # def button_label(pack, organisation)
    result = 'Buy ' + pack.name + ' (' + number_to_currency(pack.price_ex_gst) + ')'
  end

  def last_subscription(user)
    ## Find the appropriate expiry date from the last subscription by this candidate:
    if user.subscriptions.present?  # if this candidate has previous subscription
      @last_subscription = Subscription.find(user.subscriptions.last.id) # get the LAST subscription of this candidate.
      if @last_subscription.active # if last subscription is active, get the expiry date from this last subscription as the last expiry date.
        @last_expiry_date = @last_subscription.expiry_date
      elsif @last_subscription.expired # if the last subscription already expired, get today's date as the last expiry date.
        @last_expiry_date = Date.today
      end
    else
      @last_expiry_date = Date.today # if this host doesn't have previous subscription (brand new), get today's date as the last expiry date.
    end
    return @last_expiry_date
  end
end
