class Comment < ApplicationRecord
  validates :description, presence: true, length: {minimum: 2, maximum: 130}
  belongs_to :user
  belongs_to :article
  default_scope -> {order(updated_at: :desc)}
  validates :user_id, presence: true
  validates :article_id, presence: true
end