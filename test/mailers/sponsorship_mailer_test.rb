require 'test_helper'

class SponsorshipMailerTest < ActionMailer::TestCase
  test "expression_of_interest" do
    mail = SponsorshipMailer.expression_of_interest
    assert_equal "Expression of interest", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
