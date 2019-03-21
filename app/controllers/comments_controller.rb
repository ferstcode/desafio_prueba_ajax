class CommentsController < ApplicationController
    before_action :comment_params, only: %i[create]
    def create
        @comment = Comment.new(comment_params)
        @comment.user = current_user
        @comment.post_id = params[:post_id]
        @comment.save 
        
        respond_to :js
    end 


    private
    def comment_params
        params.require(:comment).permit(:content)
    end  
    
    
end
