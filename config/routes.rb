Rails.application.routes.draw do

  root 'static_pages#home'

  get '/about', to: 'static_pages#about'

  get '/how-it-works', to: 'static_pages#how-it-works'

  get '/terms', to: 'static_pages#terms'

  get '/privacy', to: 'static_pages#privacy'

  get '/signup', to: 'hoac_users#new'

  post '/signup', to: 'hoac_users#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'



  resources :hoac_users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
