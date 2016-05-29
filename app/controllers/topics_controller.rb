class TopicsController < ApplicationController
  before_action :logged_in_user, only: [:create, :edit, :update, :destroy]
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  def show
    @topic = Topic.find(params[:id])
    @metaphor = current_user.metaphors.build if logged_in?
    @metaphors = @topic.metaphors
  end

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
  
  def update
    if @topic.update(topic_params)
      # 保存に成功した場合はtopicページへリダイレクト
      flash[:success] = "Update this topic !"
      redirect_to @topic
    else
      # 保存に失敗した場合は編集画面へ戻す
      render 'edit'
    end
  end
  
  def destroy
    @topic.destroy
    flash[:success] = "Delete this topic !"
    redirect_to root_path
  end

  
  private
  
  def topic_params
    params.require(:topic).permit(:content, :title, :link, :category, :officialflag)
  end
  
  def set_topic
    @topic = Topic.find(params[:id])
  end  

end
