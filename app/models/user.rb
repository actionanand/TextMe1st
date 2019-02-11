class User < ApplicationRecord
  
  has_many :articles, dependent: :destroy
  before_save {self.email = email.downcase}
  
  validates :username, presence: true,
            uniqueness: {case_sensitive: false},
            length: {minimum: 5, maximum: 23}  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
            uniqueness: {case_sensitive: false},
            length: {minimum: 5, maximum: 50},
            format: {with: VALID_EMAIL_REGEX}
  has_secure_password
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
end