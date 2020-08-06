Rails.application.routes.draw do
  get '/team', to: 'static_pages#team'
  get '/contact', to: 'static_pages#contact'
  root 'landing_page#index'
  get '/welcome/:name_id', to: 'landing_page#welcome'
  resources :gossips do
    resources :comments
  end
  resources :profiles, only: [:show]
  resources :cities, only: [:show]
end
