# Preview all emails at http://localhost:3000/rails/mailers/survey_mailer
class SurveyMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/survey_mailer/submission
  def submission
    user = User.first
    SurveyMailer.submission(user)
  end

end
