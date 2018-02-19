class SurveysController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @survey = Survey.new
    authorize @survey
  end

  def create
    @survey = Survey.new(survey_params)
    authorize @survey
    if @survey.save
      redirect_to root_path, notice: "Thanks for completing the survey! We will get back to you within 24 hours on your travel suggestions."
    else
      redirect_to root_path, alert: "There was a problem submitting your survey responses. Please try again."
    end
  end

  def show
    authorize @survey
    @surveys = Survey.order(created_at: :desc)
  end

  private

  def survey_params
    params.require(:survey).permit(:name, :email, :start_date, :end_date, :adults, :children, :purpose, :preferences, :budget, :asia, :memorable, :other)
  end
end
