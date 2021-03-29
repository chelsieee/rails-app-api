Rails.application.routes.draw do
  namespace :api do
    resources :blogs
    resources :categories
    resources :users
    post 'auth/login', to: 'auth#login'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
