Rails.application.routes.draw do
  resources :prescriptions
  resources :ingredients
  resources :formulations
end
