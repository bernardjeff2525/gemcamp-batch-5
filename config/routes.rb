Rails.application.routes.draw do
  devise_for :users
  # get 'posts/index', to: 'posts#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'welcome#index'
  get :about, to: 'welcome#about'

  resources :posts do
    resources :comments, except: :show
  end

  resources :categories, except: :show

  namespace :api do
    resource :random_users, only: :show
    resources :news, only: :index
    namespace :v1 do
      resources :regions, only: [:index, :show] do
        resources :provinces, only: :index
      end

      resources :provinces, only: [:index, :show] do
        resources :cities, only: :index
      end

      resources :cities, only: [:index, :show] do
        resources :barangays, only: :index
      end

      resources :barangays, only: [:index, :show]
    end
  end
end
