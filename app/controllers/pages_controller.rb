class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @survey = Survey.new
  end

  def about
  end
end
