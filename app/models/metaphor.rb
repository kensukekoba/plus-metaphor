class Metaphor < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic
  
  validates :user_id, presence: true
  validates :topic_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  
  has_many :comments
  
  has_many :likes, dependent: :destroy
  
  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end

end
