class TopPagesController < ApplicationController
  def home
    @topics = Topic.all.order(created_at: :desc)
  end

end
