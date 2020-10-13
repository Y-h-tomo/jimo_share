Rails.application.routes.draw do

  get "user/new" => "user#new"
  get "post/posts" => "post#posts"
  get "/"  => "home#top"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
