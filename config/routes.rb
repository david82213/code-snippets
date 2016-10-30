Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get '/' => 'codes#index'
  root 'codes#index'
  
  resources :codes
  resources :languages
  resources :users, only:[:create, :new]
  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end
end
