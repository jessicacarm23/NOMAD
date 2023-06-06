class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @image_path = 'Digitaln.jpeg'
  end

  def show
    @city = params[:city]
  end

  def profile
  end
end
