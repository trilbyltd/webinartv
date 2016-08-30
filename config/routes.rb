Rails.application.routes.draw do
  
  resources :users,
  controller: 'clearance/users',
  only: Clearance.configuration.user_actions do
    resource :password,
      controller: 'clearance/passwords',
      only: [:create, :edit, :update]
  end
  
  resources :webinars, only: [:index, :show] do
    resources :attendees, only: [:new, :create ]
  end
  
  resources :passwords, controller: 'clearance/passwords', only: [:create, :new]
  resource :session, controller: 'clearance/sessions', only: [:create]

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get '/join(/:id)', to: 'webinars#show', as: :join_webinar
  get '/admin' => redirect("/admin/webinars") 
  get '/webinars/:id/attendees' => 'webinars#show' 
  
  if Clearance.configuration.allow_sign_up?
    get '/sign_up' => 'clearance/users#new', as: 'sign_up'
  end

  # constraints Clearance::Constraints::SignedIn.new { |a| a.admin?} do
    namespace :admin do
      resources :webinars do
        patch 'publish'
        get 'download'
        get 'duplicate'
        # resources :attendees, only: :attended
      end
    end
    resources :attendees
    resources :presenters
    resources :webinar_attendees do
      patch 'attended'
    end
    resources :users

    get "/admin" => redirect("/admin/webinars")
  # end

  constraints Clearance::Constraints::SignedIn.new do
    get "/" => redirect("/webinars")   
  end

  constraints Clearance::Constraints::SignedOut.new do
    root to: "webinars#index"
  end

end
