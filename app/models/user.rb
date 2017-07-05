class User < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	     :recoverable, :rememberable, :trackable, :validatable

	#Asociacion del modelo Usuario a los Proyectos:
	#User se usara para obtener el creador del proyecto 
	#Assigned se usara para obtener el usuario asignado al proyecto 
	has_many :user, :class_name => "Project", :foreign_key => "user_id"
	has_many :assigned, :class_name => "Project", :foreign_key => "assinged_id"
	has_many :comment
end
