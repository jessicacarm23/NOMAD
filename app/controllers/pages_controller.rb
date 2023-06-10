class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  def city
    @city = params[:city]
    @topics = Article.where(city: @city.capitalize).distinct.pluck(:topic)
    @articles = Article.where(city: @city.capitalize)
  end

  def home
    @city = params[:city]
    @topic = params[:topic]
    @articles = Article.where(city: @city, topic: @topic)
  end
end
