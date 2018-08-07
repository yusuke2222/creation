Rails.application.routes.draw do
  get 'login' => 'users#login_form'
  post 'login' => 'users#login'
  post 'logout' => 'users#logout'

  get 'users/index' => 'users#index'
  post 'users/:id/update' => 'users#update'
  post 'users/create' => 'users#create'
  get 'users/:id/edit' => 'users#edit'
  get 'users/:id' => 'users#show'

  get 'signup' => 'users#new'

  root 'posts#index'
  get 'posts/index' => 'posts#index'
  get 'posts/new' => 'posts#new'
  get 'posts/:id' => 'posts#show'
  post 'posts/create' => 'posts#create'
  get 'posts/:id/edit' => 'posts#edit'
  post 'posts/:id/update' => 'posts#update'
  post 'posts/:id/destroy' => 'posts#destroy'

  post 'likes/:post_id/create' => 'likes#create'
  post 'likes/:post_id/destroy' => 'likes#destroy'
end
