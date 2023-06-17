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

  def map
    @articles = Article.all
    @markers = @articles.geocoded.map do |city|
      {
        lat: city.latitude,
        lng: city.longitude,
      }
    end
  end

  # ---------create a new article and define by city--------
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    @article.save
    redirect_to(controller: 'cities', action: 'show', query: @article.city)
  end

  private

  def article_params
    params.require(:article).permit(:content, :title, :city, :topic)
  end
end
