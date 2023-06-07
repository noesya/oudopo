Rails.application.routes.draw do
  resources :archives
  resources :organisations
  devise_for :users
  get 'wordpress' => "pages#wordpress"
  root "pages#index"
end
