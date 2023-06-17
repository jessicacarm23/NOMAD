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
    # @articles = Article.where(city: @city, topic: @topic) #conflict this is active record search- more limited
    @articles = Article.search_by_city(@city)
  end

  def show
    @articles = Article.all
    @article = Article.find(params[:id])
    @articles_by_topic = Article.where(topic: @topic)
  end

  def show_by_topic
    @topic = params[:topic]
    @articles = Article.where(topic: @topic)
  end

  def index
    if params[:query].present?
      @articles = Article.search_by_city(@city)
    else
    @articles = Article.all
    end
  end

  def modal
    @article = Article.find(params[:id])
    render layout: false
  end

end
