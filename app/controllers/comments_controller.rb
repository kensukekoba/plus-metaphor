class CommentsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]

    def create
        @topic = Topic.find(params[:comment][:topic_id])        
        @metaphor = Metaphor.find(params[:comment][:metaphor_id])
        @comment = current_user.comments.build(comment_params)
        if @comment.save
            flash[:success] = "comment posted!"
            redirect_to topic_path(@topic)
        else
            redirect_to topic_path(@topic)
        end
    end
    
    private
  
    def comment_params
        params.require(:comment).permit(:content, :topic_id, :metaphor_id)
    end

end
