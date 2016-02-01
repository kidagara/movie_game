Rails.application.routes.draw do

	resources :movies, :lists

  root to: "home#index"
end
