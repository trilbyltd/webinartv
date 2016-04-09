Rails.application.routes.draw do
  root to: 'webinars#index'  
  get 'join(/:id)', to: 'webinars#join', as: :join_webinar
  resources :webinars, only: [:index, :show, :join]
  namespace :admin do
    resources :webinars
    resources :attendees
  end
end
