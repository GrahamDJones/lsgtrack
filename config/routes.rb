Lsgtrack::Application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :projects do
        resources :tickets
      end
    end
  end

  get "comments/create"

  devise_for :users, :controllers => { :registrations => "registrations"}
  get '/awaiting_confirmation', :to => "users#confirmation", :as => 'confirm_user'

  root :to => "projects#index"

  resources :projects do
    resources :tickets do
      collection do
        get :search
      end
      member do
        post :watch
      end
    end
    resources :time_entries
  end

  resources :time_entries

  resources :tickets do
    resources :comments
    resources :tags do
      member do
        delete :remove
      end
    end
    resources :time_entries
  end

  resources :files

  namespace :admin do
    root :to => "base#index"
    resources :users do
      resources :permissions
    end
    resources :ticket_states do
      member do
        get :make_default
      end
    end
    resources :project_states do
      member do
        get :make_default
      end
    end
  end

  put '/admin/users/:user_id/permissions', :to => "admin/permissions#update", :as => :update_user_permissions


end
