class Article < ApplicationRecord
  belongs_to :user
  has_many :saved_articles
end
