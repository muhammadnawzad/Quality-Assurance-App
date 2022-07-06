Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      resources :roles
      resources :tokens
      resources :questions
      resources :answers
    end
  end
end
