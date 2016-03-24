require 'test_helper'

class NewOrgUserProfileMailerTest < ActionMailer::TestCase
  test "notify" do
    mail = NewOrgUserProfileMailer.new_organisation_host
    assert_equal "Notify", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "register_admin" do
    mail = NewOrgUserProfileMailer.register_admin
    assert_equal "Register admin", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "register_user" do
    mail = NewOrgUserProfileMailer.register_user
    assert_equal "Register user", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
