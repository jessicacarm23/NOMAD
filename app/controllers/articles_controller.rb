class ArticlesController < ApplicationController
  def topic
    puts "yess"
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
