class ArticlesController < ApplicationController

  def topics
    @city = params[:city]
  end
end
