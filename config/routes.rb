Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:show, :create, :update, :destroy]
      resources :roles, only: [:show, :create, :update, :destroy]
      resources :tokens, only: [:create]
      resources :questions, only: [:show, :create, :update, :destroy]
      resources :answers, only: [:show, :create, :update, :destroy]
    end
  end
end

