class Article < ApplicationRecord
  belongs_to :user
  has_many :saved_articles


  include PgSearch::Model
pg_search_scope :search_by_city,
  against: [ :city ],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
end
