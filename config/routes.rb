Rails.application.routes.draw do
  resources :entities
  resources :health_professional
  resources :profession
  resources :medical_care


  get 'medical_care_professional', to: 'medical_care#medical_care_professional'
end
