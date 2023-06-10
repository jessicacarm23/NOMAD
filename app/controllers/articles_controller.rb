class ArticlesController < ApplicationController


  def topic
    @city = params[:city]
    @topic = params[:topic]
    @articles = Article.where(city: @city, topic: @topic)
  end

  def show
    @articles = Article.all
  end

  def show_by_topic
    @topic = params[:topic]
    @articles = Article.where(topic: @topic)
  end

  def
    @topic = Topic.find(params[:id])
  end

end

