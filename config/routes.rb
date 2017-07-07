Rails.application.routes.draw do


	get 'status/new'

	get 'status/create'

	get 'status/edit'

	get 'status/update'

	get 'status/destroy'

	devise_for :users

	#Custom routes to custom methods
	get 'projects/index'
	get '/projects/assign' => 'projects#assign'
	get '/projects/getProjects' => 'projects#getProjects'
	get '/tasks/sendToQa' => 'tasks#sendToQa'
	get '/users/setProfile' => 'users#setProfile'

	resources :users
	resources :clients
	resources :status
	resources :tasks
	resources :admin
	
	resources :projects do
	  resources :tasks
	  
	
	end

	resources :tasks do
	  resources :comments
	end

	root 'projects#index'

	
end
