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
    resources :news, only: :index
  end
end
