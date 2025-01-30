Rails.application.routes.draw do
  devise_for :users, skip: [:registrations]
  
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
    end

  root "posts#index"

  get "/posts/new", to:"posts#new", as: :new
  get "/posts/:id", to:"posts#show", as: :post  
  patch "/posts/:id", to:"posts#update"
  delete "/posts/:id", to:"posts#destroy"
  get "/posts/:id/edit", to:"posts#edit", as: :edit
  post "/posts", to:"posts#create", as: :posts
  
end
