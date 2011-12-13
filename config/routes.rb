SpineExample::Application.routes.draw do
  resources :follows, only: [:create, :destroy]
  root to: 'demos#following'
end
