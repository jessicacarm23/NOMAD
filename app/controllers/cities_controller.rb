class CitiesController < ApplicationController
  def show
    @city = params[:city]
    @topics = Article.group(:topic).count
  end
end
