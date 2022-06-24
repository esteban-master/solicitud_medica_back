Rails.application.routes.draw do
  resources :entities
  resources :health_professional
  resources :profession
  resources :medical_care
  resources :patient
  resources :medical_record

  get 'medical_care_professional', to: 'medical_care#medical_care_professional'
  get 'next_medical_care', to: 'medical_care#next_medical_care'
  post 'canceled_medical_care/:id', to: 'medical_care#canceled_medical_care'
  get 'patients_for_professional/:professional_id', to: 'health_professional#patients_for_professional'
  get 'medical_records', to: 'patient#medical_records'
  get 'medicines', to: 'medicine#index'
end
