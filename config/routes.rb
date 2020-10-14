Rails.application.routes.draw do




  get "user/new" => "user#new"
  # get "post/:id" => "post#show"
  get "post/index" => "post#index"

  
  get "/"  => "home#top"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
