SpineExample::Application.routes.draw do
  namespace :api do
    resources :follows, only: [:index, :create, :destroy]
    resources :people, only: :index
  end
  root to: 'demos#following'
end
