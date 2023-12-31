Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  get :about, to: 'welcome#about'

  constraints(ClientDomainConstraint.new) do
    resources :posts do
      resources :comments, except: :show
    end
  end

  resources :categories, except: :show

  constraints(AdminDomainConstraint.new) do
    namespace :admin do
      resources :users, only: :index
    end
  end

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
