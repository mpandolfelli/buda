class Comment < ApplicationRecord
	validates :comment, presence: true
	belongs_to :task
	belongs_to :user
end
