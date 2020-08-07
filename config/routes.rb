Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

#Omniauth
get '/auth/:provider/callback', to: 'sessions#omniauth'

#root page
get '/', to: 'sessions#welcome'

#login and logout
get '/login', to: 'sessions#new'
post '/login', to: 'sessions#create'
delete '/logout', to: 'sessions#destroy'

#signup
get 'signup', to: 'users#new'
post 'signup', to: 'users#create'

#nested routes
resources :categories, only: [:index, :new, :create, :show] do
  resources :photos
end

resources :users, only: [:new, :create, :show] do
  resources :photos, only:[:index, :new, :create, :edit, :destroy]
end

resources :photos

end

