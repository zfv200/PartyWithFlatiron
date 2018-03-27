Rails.application.routes.draw do
  get '/', to: 'users#new'
  post '/users', to: 'users#create'
  get '/home', to: 'welcome#home'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

  resources :events do
    resources :rsvps, only: [:new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
