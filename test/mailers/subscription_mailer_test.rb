require 'test_helper'

class SubscriptionMailerTest < ActionMailer::TestCase
  test "expiring_in_30_days" do
    mail = SubscriptionMailer.expiring_in_30_days
    assert_equal "Expiring in 30 days", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
