class CitiesController < ApplicationController
  def show
    @city_articles = Article.search_by_city(params[:query])
    @topics = Article.all.distinct.pluck(:topic)
  end
end
