Rails.application.routes.draw do
  devise_for :users
  root to: "projects#index"
  resources :projects, only: [:new, :create, :show, :edit, :update]
end

