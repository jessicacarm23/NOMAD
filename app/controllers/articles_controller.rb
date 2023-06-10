class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: :toggle_favorite
  def favorite
    article = Article.find(params[:article_id])
    current_user.favorited?(article) ? current_user.unfavorite(article) : current_user.favorite(article)
    redirect_to city_articles_topic_path(article.city, article.topic)
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
