Rails.application.routes.draw do
  resources :roles

  # API Definition
  namespace :api, default: { format: :json }  do
    namespace :v1 do
      resources :users
      resources :roles
    end
  end

end
