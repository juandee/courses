Rails.application.routes.draw do
  resources :grades
  resources :pupils
  resources :exams
  resources :courses
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
