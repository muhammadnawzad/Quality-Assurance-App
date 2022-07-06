Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, except: [:new, :edit]
      resources :roles, except: [:new, :edit]
      resources :tokens, only: [:create]
      resources :questions, except: [:new, :edit]
      resources :answers, except: [:new, :edit] do
        put :choose_the_best, on: :member
      end
    end
  end
end
