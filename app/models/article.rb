class Article < ApplicationRecord
  belongs_to :user
  has_many :saved_articles
  geocoded_by :city
  after_validation :geocode, if: :will_save_change_to_city?

  acts_as_favoritable
  include PgSearch::Model
  pg_search_scope :search_by_city,
    against: [ :city ],
    using: {
      tsearch: { prefix: true }
  }


end
