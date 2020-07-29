Rails.application.routes.draw do
  resources :catergories
  resources :photos
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
get '/auth/:provider/callback', to: 'sessions#omniauth'


get '/', to: 'sessions#new'
post '/', to: 'sessions#create'
delete '/logout', to: 'sessions#destroy'

get 'signup', to: 'users#new'
post 'signup', to: 'users#create'


end
