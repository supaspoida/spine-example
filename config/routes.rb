SpineExample::Application.routes.draw do
  namespace :api do
    resources :follows, only: :index
    resources :people, only: :index
  end
  resources :follows, only: [:create, :destroy]
  root to: 'demos#following'
end
