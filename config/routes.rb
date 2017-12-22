Rails.application.routes.draw do
  	devise_for :users
	resources :courses do
  		resources :exams do
  			resources :grades
  		end
  		resources :pupils
	end
	root 'courses#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
