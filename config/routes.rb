Rails.application.routes.draw do
  devise_for :users
  root "posts#index"

  get "/posts/new", to:"posts#new", as: :new
  get "/posts/:id", to:"posts#show", as: :post  
  patch "/posts/:id", to:"posts#update"
  delete "/posts/:id", to:"posts#destroy"
  get "/posts/:id/edit", to:"posts#edit", as: :edit
  post "/posts", to:"posts#create", as: :posts
  
end
