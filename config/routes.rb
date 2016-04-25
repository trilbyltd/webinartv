Rails.application.routes.draw do

  get '/join(/:id)', to: 'webinars#join', as: :join_webinar
  resources :webinars, only: [:index, :show, :join] do
    resources :attendees, only: [:new]
  end
  resources :webinar_attendees, only: :create

  # delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  # get "/sign_in" => "clearance/sessions#new", as: "sign_in"

  constraints Clearance::Constraints::SignedIn.new(&:admin?) do
    namespace :admin do
      resources :webinars
    end
    resources :attendees
    resources :presenters
    get "/" => redirect("/admin/webinars")
  end

  constraints Clearance::Constraints::SignedIn.new do
    get "/" => redirect("/webinars")   
  end

  constraints Clearance::Constraints::SignedOut.new do
    root to: "webinars#index"
  end

end
