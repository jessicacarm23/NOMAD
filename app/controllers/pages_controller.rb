class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @image_path = 'Digitaln.jpeg'
    @image_path2 = 'Map.png'
  end

  # def show
  #   @city = params[:city]
  # end

  def city
    @city = params[:city]
    @topics = Article.where(city: @city).distinct.pluck(:topic)
  end
end
