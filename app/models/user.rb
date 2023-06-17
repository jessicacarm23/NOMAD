class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable



  include PgSearch::Model
pg_search_scope :search_by_city,
  against: [ :city ],
  using: {
    tsearch: { prefix: true }
  }
  has_many :articles, dependent: :destroy
  has_many :saved_articles
  has_many :messages, dependent: :destroy
  acts_as_favoritor
end
