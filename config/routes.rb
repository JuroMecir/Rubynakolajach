Rails.application.routes.draw do
  get 'sessions/new'
  get '/home', to: 'fisherman_friend#home'
  get '/help', to: 'fisherman_friend#help'
  get '/about', to: 'fisherman_friend#about'
  get '/contact', to: 'fisherman_friend#contact'
  get  '/signup',  to: 'users#new'
  post '/signup', to:'users#create'
  get '/login', to:'sessions#new'
  post '/login', to: 'sessions#create'
  delete 'logout', to:'sessions#destroy'
  get '/catches', to:'fisherman_friend#home'
  root 'fisherman_friend#home'

  resources :users
  resources :catches,          only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
