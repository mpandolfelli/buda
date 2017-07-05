class ProjectsController < ApplicationController
	#Agrego constantes
	include Constants

	#******************************
 	# API METHOD FOR PROJECTS
 	#******************************
	def index
    	#@projects = Project.all
    	

    	@projects = Project.joins(:tasks, :assigned, :user).where('tasks.status_id' => STATUS_QA)
  	end

  	def show
    	@project = Project.find(params[:id])
  		
  	end

	def new
		@project = Project.new
		@clients = Client.all
	end

	def edit
    	@project = Project.find(params[:id])
    	@clients = Client.all
  	end


	def create
		@clients = Client.all
		@project = Project.new(project_params)
		#Defino el status del proyecto como pending cuando lo creo
 		@project.status_id = STATUS_PENDING
 		@project.user_id = current_user.id
		
		if @project.save
		    redirect_to @project
		else
		    render 'new'
		end
	end

	
  	
  	def update
		@project = Project.find(params[:id])
		 
		if @project.update(project_params)
		    redirect_to @project
		else
		    render 'edit'
		end
	end

	def destroy
	    @project = Project.find(params[:id])
	    @project.destroy
	 
	    redirect_to projects_path
 	end


 	#******************************
 	# HELPER FUNCTIONS
 	#******************************

 	#Asignar proyecto a usuario
 	#Se actualiza el status del proyecto
 	def assign
		@project = Project.find(params[:project_id])
		@project.update(assigned_id: current_user.id)
		@project.update(status_id: STATUS_IN_PROGRESS)
		redirect_to @project
	end	

	def query(sql)
        results = ActiveRecord::Base.connection.execute(sql)
        if results.present?
            return results
        else
            return nil
        end
    end

	private
		def project_params
	    	params.require(:project).permit(:name, :description, :deadline, :client_id)
		end


end
