PostsApp::Application.routes.draw do
  resources :users, only: [:new, :create]
  resource :sessions, only: [:new, :create, :destroy]
  resources :links
  resources :comments, only: [:create, :destroy]
end
