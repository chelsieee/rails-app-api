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

end
