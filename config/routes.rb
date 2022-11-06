Rails.application.routes.draw do
  # get 'users/index'
  devise_for :users
  unauthenticated :user do
    root to: 'users#index'
  end
  # get 'splash/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  authenticated :user do
    root to: 'pictures#index', as: :authenticated_root
  end

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :pictures

  # Defines the root path route ("/")
  # root "articles#index"
  # root to: 'splash#index'
end
