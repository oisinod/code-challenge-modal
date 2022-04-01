Rails.application.routes.draw do
  root 'cycles#index'
  resources :invitations, only: [:create]
end
