Rails.application.routes.draw do
  namespace :api do
    resources :blogs do
      collection do
     get 'myblog'
     end
    end
    resources :categories
    resources :users
    post 'auth/login', to: 'auth#login'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
