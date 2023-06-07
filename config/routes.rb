Rails.application.routes.draw do
  devise_for :users
  resources :organisations, param: :slug
  resources :archives do 
    member do
      get :secret
    end
  end
  get 'wordpress' => 'pages#wordpress'
  get ':organisation_slug' => 'direct#organisation', as: :direct_organisation
  get ':organisation_slug/:archive_slug' => 'direct#archive', as: :direct_archive
  root 'pages#index'
end
