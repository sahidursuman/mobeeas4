require 'test_helper'

class EducationMailerTest < ActionMailer::TestCase
  test "notify" do
    mail = EducationMailer.notify
    assert_equal "Notify", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "approved_by_admin" do
    mail = EducationMailer.approved_by_admin
    assert_equal "Approved by admin", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
