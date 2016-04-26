Rails.application.routes.draw do
  resources :passwords,
      controller: 'clearance/passwords',
      only: [:create, :new]
  resource :session,
      controller: 'clearance/sessions',
      only: [:create]

  resources :users,
  controller: 'clearance/users',
  only: Clearance.configuration.user_actions do
    resource :password,
      controller: 'clearance/passwords',
      only: [:create, :edit, :update]
  end
  
  resources :webinars, only: [:index, :show, :join]
  resources :attendees, only: [:new, :create]
  # resources :webinar_attendees, only: [:create, :new]

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  if Clearance.configuration.allow_sign_up?
    get '/sign_up' => 'clearance/users#new', as: 'sign_up'
  end
  get '/join(/:id)', to: 'webinars#join', as: :join_webinar
  
  constraints Clearance::Constraints::SignedIn.new(&:admin?) do
    namespace :admin do
      resources :webinars
    end
    resources :attendees
    resources :presenters
    resources :users

    get "/" => redirect("/admin/webinars")
  end

  constraints Clearance::Constraints::SignedIn.new do
    get "/" => redirect("/webinars")   
  end

  constraints Clearance::Constraints::SignedOut.new do
    root to: "webinars#index"
  end

end
