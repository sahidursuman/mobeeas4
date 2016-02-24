require 'test_helper'

class AccountsMailerTest < ActionMailer::TestCase
  test "subscription_receipt" do
    mail = AccountsMailer.subscription_receipt
    assert_equal "Subscription receipt", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "token_receipt" do
    mail = AccountsMailer.token_receipt
    assert_equal "Token receipt", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
