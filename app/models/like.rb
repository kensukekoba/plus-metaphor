class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :metaphor, counter_cache: :likes_count

end
