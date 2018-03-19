# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
# root to: 'home#index'
# get '/sessions/new', to: 'sessions#new'

resources :home,        only: [:index]
resources :sessions,    only: [:new, :create, :destroy]
resources :users,       only: [:new, :create]
