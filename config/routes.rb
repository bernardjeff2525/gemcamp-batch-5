Rails.application.routes.draw do
  # get 'posts/index', to: 'posts#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'welcome#index'
  get :about, to: 'welcome#about'

  resources :posts do
    resources :comments, except: :show
  end
end
