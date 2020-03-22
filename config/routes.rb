Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bloggers, only: [:new,:index,:edit,:show,:create]
  resources :destinations, only: [:new,:index,:edit,:show,:create]
  resources :posts, only: [:new,:index,:edit,:show,:create]
  #resources :blogger, :posts, :destinations, only: [:new,:index,:edit,:show,:update]
end
