class CommentsController < ApplicationController
	def create
	    @task = Task.find(params[:task_id])
	    @comment = @task.comments.create(task_params.merge!(user_id: current_user.id))
	   
	    redirect_to task_path(@task)
	end
	 
	private
	    def task_params
	      params.require(:comment).permit(:comment)
	    end
end
