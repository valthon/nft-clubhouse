Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "static#home"

  get '/club', to: "club#dashboard", as: 'club'

  get '/signin', to: 'sessions#new', as: 'new_session'
  match '/signout', to: 'sessions#destroy', as: 'destroy_session', via: %i[get post delete]
  post '/auth/:provider/callback', to: 'sessions#create', as: 'create_session'
  # match '/auth/nft', to: 'sessions#nft', via: :all
end
