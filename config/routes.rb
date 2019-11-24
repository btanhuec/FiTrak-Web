Rails.application.routes.draw do
  resources :clients
  resources :profiles
  resources :excercises
  resources :workouts
  devise_for :users
  resources :pages

  devise_scope :user do
    authenticated :user do
      root 'pages#index', as: :authenticated_root
      get '/users/sign_out' => 'devise/sessions#destroy'
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
