class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: :toggle_favorite
  def toggle_favorite
    @article = Article.find_by(id: params[:id])
    # current_user.favorited?(@article)  ?
    # current_user.unfavorite(@article) : current_user.favorite(@article)ex
  end

  def topic

    @city = params[:city]
    @topic = params[:topic]
    @articles = Article.where(city: @city.capitalize, topic: @topic.capitalize)

  end

  def show
    @articles = Article.all
  end

  def show_by_topic
    @topic = params[:topic]
    @articles = Article.where(topic: @topic)
  end

end
