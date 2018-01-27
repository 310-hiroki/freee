Rails.application.routes.draw do

  get '/messages/:id', to: 'chat_messages#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  root to: 'sessions#new'

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
