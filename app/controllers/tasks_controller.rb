class TasksController < ApplicationController
	#Agrego constantes
	include Constants

	#******************************
 	# API METHOD FOR PROJECTS
 	#******************************
	def index
    	@project = Project.find(params[:project_id])
    	@tasks = @project.tasks
  	end
  	def show
    	@task = Task.find(params[:id])
  		
  	end
	def create
	    @project = Project.find(params[:project_id])
	   
	    #Si el proyecto esta en pending, guardo la tarea como pending
	    if @project.status_id == STATUS_PENDING
			@task = @project.tasks.create(task_params.merge!(status_id: STATUS_PENDING))
	    #Si el proyecto esta in progress, guardo la tarea como in progress
	    else
	    	@task = @project.tasks.create(task_params.merge!(status_id: STATUS_IN_PROGRESS))
	    	
	    end

	   

	    redirect_to project_path(@project)
	end


	#******************************
 	# HELPER FUNCTIONS
 	#******************************

 	#Envio tarea a QA
 	#Se actualiza el status de la tarea a QA
 	#TO-DO : Crear una funcion simil que cierre la tarea sin enviarla a QA
 	def sendToQa
		@task = Task.find(params[:task_id])
		@task.update(url: 'http://testurl.com')
		@task.update(status_id: STATUS_QA)
		redirect_to @task
	end	
	 
	private
	    def task_params
	      params.require(:task).permit(:name, :description, :deadline)
	    end

end
