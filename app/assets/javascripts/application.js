// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require semantic-ui
//= require mustache

$(document).ready(function(){
	var open = false;

	$('.search-projects').click(function(){
		if(open){
			open = false;
			$('.search-box').slideUp();
		}else{
			open = true;
			$('.search-box').slideDown();
		}	
		
	});

	$('#filters .item').click(function(){
		$('#filters .item').each(function(){
			if($(this).hasClass('active')){
				$(this).removeClass('active');
			}
		});
		$(this).addClass('active');
		var status = $(this).data('status');
		getProjects(status);
	});

	$('.ui.search')
	  .search({
	    apiSettings: {
	      url: 'projects/searchProjects?query={query}'
	    },
	    fields: {
	      results : 'projects',
	      title   : 'name',
	      actionUrl     : 'html_url'
	    },
	    action: {
          "url": '/path/to/results',
          "text": "View all 202 results"
        },
	    minCharacters : 3
	  });


	$('.ui.sticky')
  .sticky({
    context: '#example1'
  })
;
	

	function getProjects(status_id){
		$('.app-projects').html('');
		//Mustache config
		var template = $('#template-projects-list').html();
		Mustache.parse(template);  

		if(status_id){
			var url = 'projects/getProjects?status_id='+status_id;
		}else{
			var url = 'projects/getProjects';
		}
		
		$.ajax({
		  url: url,
		  success: function(data){
		  	var isAssigned;
		  	var status;
		  	console.log(data);
		  	for (var i in data) {
             	if (data[i].assigned){
             		isAssigned = true;
             	}else{
             		isAssigned = false;
             	}

             	switch(data[i].status_id) {
				    case 1:
				        status = 'Pending';
				        break;
				    case 2:
				        status = 'In Progress';
				        break;
				    case 4:
				        status = 'Finished';
				        break;
				    
				}

				console.log(data[i].name);
				var rendered = Mustache.render(template, 
					{
						id: data[i].id,
						name: data[i].name, 
						client: data[i].client.name,
						description: data[i].description,
						assigned: data[i].assigned,
						isAssigned: isAssigned,
						status: status,
						status_id: data[i].status_id,
						deadline: data[i].deadline
					});
				$('.app-projects').append(rendered);
            }
		  	
		  },
		  dataType: 'json'
		});
	}
	
	getProjects();

});