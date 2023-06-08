class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :messages
  has_many :saved_articles
  has_many :articles


  include PgSearch::Model
pg_search_scope :search_by_city,
  against: [ :city ],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
end
