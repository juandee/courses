Rails.application.routes.draw do
  resources :courses do
  	resources :exams do
  		resources :grades
  	end
  	resources :pupils
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
