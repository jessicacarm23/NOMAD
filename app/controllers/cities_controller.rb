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

def map_image
  access_token = 'pk.eyJ1IjoiamFtZXNld2luZzAiLCJhIjoiY2xmbGlreGFrMDJhOTN3cjJ1anVhN2xpYSJ9.gB6KxglmzVc06uUVc2BkFQ'
  style = 'mapbox://styles/mapbox/streets-v11'
  zoom = 12
  lat = 37.7749
  lon = -122.4194
  width = 800
  height = 600

  map_url = "https://api.mapbox.com/styles/v1/#{style}/static/#{lon},#{lat},#{zoom}/#{width}x#{height}?access_token=#{access_token}"
  @map_image_url = HTTParty.get(map_url).body

  render 'your_view_file'
end

end
