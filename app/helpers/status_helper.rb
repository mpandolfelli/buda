module StatusHelper
	def status(status_id)
		@statusName
		case status_id
			when 1    
			  @statusName = "Pending" 
			when 2    
			  @statusName = "In Progress"
			when 3    
			  @statusName = "QA"
			when 4    
			  @statusName = "Finished"
			
			end
		"<span class=\"status status-{status_id}\">"+@statusName+"</span>"
	end
end
