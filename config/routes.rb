Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, except: [:new, :edit]do
        collection do
          get 'login'
        end
      end
      resources :roles, except: [:new, :edit]
      resources :questions, except: [:new, :edit]
      resources :answers, except: [:new, :edit] do
        put :choose_the_best_answer, on: :member
      end
    end
  end
end
