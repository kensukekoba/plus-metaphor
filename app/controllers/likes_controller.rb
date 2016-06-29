class LikesController < ApplicationController
    before_action :logged_in_user
    
    def create
        @like = Like.create(user_id: current_user.id, metaphor_id: params[:metaphor_id])
        @likes = Like.where(metaphor_id: params[:metaphor_id])
        @metaphors = Metaphor.all
    end

    def destroy
        like = Like.find_by(user_id: current_user.id, metaphor_id: params[:metaphor_id])
        like.destroy
        @likes = Metaphor.where(metaphor_id: params[:metaphor_id])
        @metaphors = Metaphor.all
    end 
    
    private
    
    def like_params
        params.require(:like).permit(:metaphor_id)
    end
    
end
