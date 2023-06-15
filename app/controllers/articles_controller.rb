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

  # ---------create a new article and define by city--------
  def new
    @article = Article.find(params[:city]) #should it find by city?
    @article = Article.new
  end



  before_action :set_city, only: %i[new create] #if there is no city table?

  def create
    @article = Article.new(review_params)
    @article.city = @city
    @article.save
    redirect_to article_path(@article)
  end

  private

  def set_city
    @article = Article.find(params[:city])
  end

  def review_params
    params.require(:article).permit(:content) #permit title and topic?
  end
end


end
