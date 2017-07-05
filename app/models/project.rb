class Project < ApplicationRecord
	#Validations
	validates :name, presence: true, length: { minimum: 5 }
	validates :description, presence: true
	validates :deadline, presence: true
	validates :client_id, presence: true
	

	belongs_to :client
	belongs_to :status, optional: true
	belongs_to :user, :class_name => "User"
	belongs_to :assigned, :class_name => "User", optional: true
	
	has_many :tasks

	
	
end
