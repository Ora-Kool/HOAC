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

  get '/sign-in', to: 'doctor_sessions#new'
  post '/sign-in', to: 'doctor_sessions#create'
  delete '/sign-out', to: 'doctor_sessions#destroy'

  get '/doctors/:id', to: 'doctors#dashboard'





  resources :hoac_users
  resources :doctors


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
