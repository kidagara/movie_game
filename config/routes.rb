Rails.application.routes.draw do

  get "/sign_in", to: "sessions#new"
  delete "/sign_out", to: "sessions#destroy"
  get "/auth/:provider/callback", to: "sessions#create"
  get "/auth/failure", to: redirect("/")

	resources :movies, :lists, :users, :sessions

  root to: "home#index"
end
