class Message < ApplicationRecord
 belongs_to :user
 validates :content, presence: true
 validates :user_id, presence: true
  
  def self.most_recent
    order(:created_at).last(25)
  end
  
end