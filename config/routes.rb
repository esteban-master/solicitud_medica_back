Rails.application.routes.draw do
  resources :entities
  resources :health_professional do
    collection do
      get 'patients_for_professional/:professional_id', to: 'health_professional#patients_for_professional'
      get 'upcoming_appointments/:id', to: 'health_professional#upcoming_appointments'
    end
  end
  resources :profession
  resources :medical_care do
    collection do
      get 'medical_care_professional', to: 'medical_care#medical_care_professional'
      get 'next_medical_care', to: 'medical_care#next_medical_care'
      put '', to: 'medical_care#update'
      post 'canceled_medical_care/:id', to: 'medical_care#canceled_medical_care'
    end
  end
  resources :patient do
    collection do
      get 'last_professionals/:id', to: 'patient#last_professionals'
      get 'account_request', to: 'patient#account_request'
      get 'medical_records', to: 'patient#medical_records'
    end
  end
  resources :medical_record
  resources :medicine
end
