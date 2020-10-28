Rails.application.routes.draw do
  get 'acceptances/index'
  devise_for :users
  root to: "items#index"
  resources :items, only: [:new, :create, :show, :update, :edit, :destroy] do
    resources :buyers, only: [:index, :create]
  end
end
