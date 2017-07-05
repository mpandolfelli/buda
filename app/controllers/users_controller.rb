class UsersController < ApplicationController
	#Agrego constantes
	include Constants

	def index
    	@users = User.all
  	end

	#******************************
 	# HELPER FUNCTIONS
 	#******************************

 	#Envio tarea a QA
 	#Se actualiza el status de la tarea a QA
 	#TO-DO : Crear una funcion simil que cierre la tarea sin enviarla a QA
 	def setProfile
		@user = User.find(params[:user_id])
		@user.update(profile_id: params[:profile_id])
		#@task.update(status_id: STATUS_QA)
		redirect_to '/admin'
	end	
	

end
