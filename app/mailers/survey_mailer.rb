class SurveyMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.survey_mailer.submission.subject
  #
  def submission(survey)
    @survey = survey
    mail(
      to:       "beentho.info@gmail.com",
      subject:  "New Submission by "+@survey.name.capitalize
    )
  end
end
