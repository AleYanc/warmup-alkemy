Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'auth/login', to: 'auth#create'
      post 'auth/sign_up', to: 'auth#sign_up'
      delete 'logout', to: 'auth#destroy'
      resources :users, except: [:create]
      resources :posts
      get 'retrieve', to: 'posts#retrieve_deleted'
      post 'recover/:id', to: 'posts#recover'
    end
  end
end
