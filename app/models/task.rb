class Task < ApplicationRecord
	validates :name, presence: true, length: { minimum: 5 }
	validates :description, presence: true
	validates :deadline, presence: true
	
	belongs_to :project
	has_many :comments
end
