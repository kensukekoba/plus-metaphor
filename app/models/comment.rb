class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic
  belongs_to :metaphor
  
  validates :user_id, presence: true
  validates :topic_id, presence: true
  validates :metaphor_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  
end
