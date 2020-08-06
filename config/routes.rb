Rails.application.routes.draw do
  resources :likes, except: [:index, :edit, :update]
  get '/team', to: 'static_pages#team'
  get '/contact', to: 'static_pages#contact'
  root 'landing_page#index'
  get '/welcome/:name_id', to: 'landing_page#welcome'
  resources :gossips do
    resources :comments
  end
  resources :profiles, except: [:index]
  resources :cities, only: [:show]
  resources :sessions, only: [:new, :create, :destroy]
end
