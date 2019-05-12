Rails.application.routes.draw do
  get 'sessions/new'
  get '/home', to: 'fisherman_friend#home'
  get '/help', to: 'fisherman_friend#help'
  get '/about', to: 'fisherman_friend#about'
  get '/contact', to: 'fisherman_friend#contact'
  get '/areas', to: 'areas#index'
  get  '/signup',  to: 'users#new'
  post '/signup', to:'users#create'
  get '/login', to:'sessions#new'
  post '/login', to: 'sessions#create'
  delete 'logout', to:'sessions#destroy'
  root 'fisherman_friend#home'


  resources :users
  resources :catches
  resources :areas
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
