Rails.application.routes.draw do
  root to: "projects#index"
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  resources :projects, only: [:new, :create, :show, :edit, :update] do
    resources :likes, only: [:create, :destroy]
  end
  resources :purchase, only: [:show] do
    member do
      post :pay
      get :done
    end
  end
  resources :users, only: [] do
    member do
      get :mypage
    end
  end
  resources :cards, only: [:new, :show] do
    member do
      post :pay
      post :delete
    end
  end
end

