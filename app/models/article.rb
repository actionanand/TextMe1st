class Article < ApplicationRecord
  
  belongs_to :user
  has_many :article_categories
  has_many :categories, through: :article_categories
  validates :user_id, presence: true
  default_scope -> {order(updated_at: :desc)}
  validates :title, presence: true, length: {minimum: 5, maximum: 50}
  validates :description, presence: true, length: {minimum: 13, maximum: 1300}
  has_many :comments, dependent: :destroy
end
