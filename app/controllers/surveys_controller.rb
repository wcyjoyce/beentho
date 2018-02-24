require "csv"

class SurveysController < ApplicationController
  # before_action :set_survey, only: [:show]
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

  def index
    @surveys = policy_scope(Survey).order(created_at: :asc)

    # csv_options = {col_sep: ',', force_quotes: true, quote_char: '"' }
    # filepath = "app/views/surveys/responses.csv"

    # CSV.open(filepath, "wb", csv_options) do |csv|
    #   csv << [:name, :email, :start_date, :end_date, :adults, :children, :purpose, :preferences, :budget, :asia, :memorable, :other]
    #   @surveys.each do |survey|
    #     csv << [survey[:name], survey[:email], survey[:start_date], survey[:end_date], survey[:adults], survey[:children], survey[:purpose], survey[:preferences], survey[:budget], survey[:asia], survey[:memorable], survey[:other]]
    #   end
    # end

    respond_to do |format|
      format.html
      format.csv { send_data @surveys.to_csv, filename: "responses-#{Date.today}.csv"}
    end
  end

  private

  def survey_params
    params.require(:survey).permit(:name, :email, :start_date, :end_date, :adults, :children, :purpose, :preferences, :budget, :asia, :memorable, :other)
  end

  def set_survey
    @survey = Survey.find(params[:id])
  end
end
