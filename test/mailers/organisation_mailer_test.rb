require 'test_helper'

class OrganisationMailerTest < ActionMailer::TestCase
  test "notify_admin_host" do
    mail = OrganisationMailer.notify_admin_host
    assert_equal "Notify admin host", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "notify_host" do
    mail = OrganisationMailer.notify_host
    assert_equal "Notify host", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
