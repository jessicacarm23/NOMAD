class SavedArticlesController < ApplicationController
  def index
    @saved_articles = current_user.all_favorited
  end
end
