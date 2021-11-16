Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'auth', to: 'auth#create'
      post 'auth/sign_up', to: 'users#create'
      delete 'logout', to: 'auth#destroy'
      resources :users
      resources :posts
      get 'retrieve', to: 'posts#retrieve_deleted'
      post 'recover/:id', to: 'posts#recover'
    end
  end
end
