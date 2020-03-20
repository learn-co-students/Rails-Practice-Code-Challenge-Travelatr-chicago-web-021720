Rails.application.routes.draw do

  resources :bloggers, only: [:index, :new, :create, :show]
  resources :posts, except: [:delete, :index]
  resources :destinations, only: [:index, :show]

end
