Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/users/new', to: 'users#new'
  post '/users', to: 'welcome#home'
end
