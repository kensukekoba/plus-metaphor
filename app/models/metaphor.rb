class Metaphor < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic
  
  validates :user_id, presence: true
  validates :topic_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  
  has_many :comments
  
end