require 'test_helper'

class NewlyAddedSkillMailerTest < ActionMailer::TestCase
  test "approve_new_skill" do
    mail = NewlyAddedSkillMailer.approve_new_skill
    assert_equal "Approve new skill", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
