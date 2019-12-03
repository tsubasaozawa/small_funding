Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  root to: "index#top"
  resources :projects, only: [:new, :create, :show, :edit, :update] do
    collection do
      get :categorylist
      get :search
    end
    resources :feedbacks, except: [:index]
    resources :reviews
    resources :likes, only: [:create, :destroy]
  end
  resources :purchase, only: [:show] do
    member do
      post :pay
      get :done
    end
  end
  resources :users, only: [:new, :create, :edit, :update, :destroy] do
    member do
      get :mypage
      get :myworks
      get :myprojects
      get :investing_projects
    end
  end
  resources :cards, only: [:new, :show] do
    member do
      post :pay
      post :delete
    end
  end
end

