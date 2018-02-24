require 'test_helper'

class SurveyMailerTest < ActionMailer::TestCase
  test "submission" do
    mail = SurveyMailer.submission
    assert_equal "Submission", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
