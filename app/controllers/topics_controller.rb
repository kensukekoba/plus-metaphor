class TopicsController < ApplicationController
  before_action :logged_in_user, only: [:create]

  def new
    @topic = Topic.new
  end

  def create
    @topic = current_user.topics.build(topic_params)
    if @topic.save
      flash[:success] = "Topic created!"
      redirect_to root_url
    else
      render 'new'
    end
  end
  
  private
  def topic_params
    params.require(:topic).permit(:content, :title, :link, :category)
  end
end
