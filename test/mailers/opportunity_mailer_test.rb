require 'test_helper'

class OpportunityMailerTest < ActionMailer::TestCase
  test "invited" do
    mail = OpportunityMailer.invited
    assert_equal "Invited", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "accepted" do
    mail = OpportunityMailer.accepted
    assert_equal "Accepted", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "assign_a_token" do
    mail = OpportunityMailer.assign_a_token
    assert_equal "Assign a token", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
