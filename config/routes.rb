Rails.application.routes.draw do
  root to: 'restaurants#index'
  devise_for :users
  resources :users do
    collection do
      patch 'update_password'
    end
    member do
      get 'edit_password'
    end
  end
  resources :restaurants  do
    member do 
      get 'preview'
    end
    collection do
      get 'preview_all'
    end
    resources :comments
    resources :labels
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
