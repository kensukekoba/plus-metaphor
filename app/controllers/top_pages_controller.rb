class TopPagesController < ApplicationController
  def home
    @topics = Topic.all.order(created_at: :desc)
    @topics_rank = Topic.all.order(created_at: :asc)
  end

end
