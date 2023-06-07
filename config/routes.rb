Rails.application.routes.draw do
  resources :archives do 
    member do
      get :secret
    end
  end
  resources :organisations
  devise_for :users
  get 'wordpress' => "pages#wordpress"
  root "pages#index"
end
