class MetaphorsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]
    before_action :set_metaphor, only: [:destroy]
    
    def create
        @topic = Topic.find(params[:metaphor][:topic_id])
        @user = @topic.user
        @metaphor = current_user.metaphors.build(metaphor_params)
        if @metaphor.save
            flash[:success] = "metaphor posted!"
            MetaphorMailer.add_metaphor(@user).deliver_now
            redirect_to topic_path(@topic)
        else
            redirect_to topic_path(@topic)
        end
    end
    
    def destroy
        @metaphor.destroy
        flash[:success] = "Delete this metaphor !"
        redirect_to root_path
    end

    private
  
    def metaphor_params
        params.require(:metaphor).permit(:content, :topic_id)
    end
    
    def set_metaphor
        @metaphor = Metaphor.find(params[:id])
    end  
  
end
