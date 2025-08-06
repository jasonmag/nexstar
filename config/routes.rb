Rails.application.routes.draw do
  devise_for :users
  
  root "pages#home"
  get "/about", to: "pages#about"
  
  resources :articles, only: [:index, :show]

  resources :projects, only: [:index, :show]

  resources :contacts, only: [:new, :create]
  get 'contact', to: 'contacts#new', as: 'contact' # And optionally, if you prefer a friendly path

  namespace :admin do
    root to: "dashboard#index"
    resources :articles
    resources :projects
    resources :users
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
