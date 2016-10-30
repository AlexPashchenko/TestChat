Rails.application.routes.draw do
  root 'rooms#index'
  devise_for :users
  resources :rooms do
    resources :messages
      end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
