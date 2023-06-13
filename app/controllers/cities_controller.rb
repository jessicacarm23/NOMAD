require 'httparty'

class CitiesController < ApplicationController
  def show
    @city_name = params[:query]
    @city_articles = Article.search_by_city(params[:query])
    @topics = Article.all.distinct.pluck(:topic)
  end

  def index
    @cities = City.all
    # The `geocoded` scope filters only flats with coordinates
    @markers = @cities.geocoded.map do |city|
      {
        lat: city.latitude,
        lng: city.longitude
      }
    end
  end





end
