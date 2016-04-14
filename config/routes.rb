Rails.application.routes.draw do
  resources :presenters
  root to: 'webinars#index'  
  get 'join(/:id)', to: 'webinars#join', as: :join_webinar
  resources :webinars, only: [:index, :show, :join]
  namespace :admin do
    resources :webinars
    resources :attendees
    resources :presenters
  end
end
