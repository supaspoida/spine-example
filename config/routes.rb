SpineExample::Application.routes.draw do
  resources :follows, only: :create
  root to: 'demos#following'
end
