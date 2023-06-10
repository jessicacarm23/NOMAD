class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  def city
    @city = params[:city]
    @topics = Article.where(city: @city).distinct.pluck(:topic)
  end
end
