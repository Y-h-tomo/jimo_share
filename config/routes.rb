Rails.application.routes.draw do
  # resources :posts  do
  #   resources :comments, only: [:create, :destroy]
  # end


 get   "posts/:id/comment" => "posts#comment"
 post "posts/:post_id/comments/create" => "comments#create"
 post "posts/:post_id/comments/:id/destroy" => "comments#destroy"

  post "users/:id/update" => "users#update"
  get "users/:id/edit" => "users#edit"
  post "users/create" => "users#create"
  get "signup" => "users#new"

# ユーザー検索
  get "users/search" => "users#search"

  get "users/index" => "users#index"
  get "users/:id" => "users#show"

  # ゲストログイン用
    post "/login/guest" => "home#guest"

  post "login" => "users#login"
  post "logout" => "users#logout"
  get "login" => "users#login_form"
  get "users/:id/likes" => "users#likes"

  # post検索
  get "posts/search" => "posts#search"

  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"
  get "posts/:id" => "posts#show"
  post "posts/create" => "posts#create"
  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"



  get "/"  => "home#top"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
