class Topic < ActiveRecord::Base
  belongs_to :user
  
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 30 }
  validates :content, presence: true
  validates :category, presence: true
  
  has_many :metaphors
  has_many :comments
  
end
