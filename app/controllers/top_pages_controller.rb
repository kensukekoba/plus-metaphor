class TopPagesController < ApplicationController
  def home
    @topics = Topic.all.order(created_at: :desc)
    @topics_rank = Metaphor.group(:topic_id).order('count_all desc').limit(15).count.keys.map{|id| Topic.find(id)}
    @topics_official = Topic.where(officialflag: true).order(created_at: :desc)
  end

end
