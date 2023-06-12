Rails.application.routes.draw do
  match "/delayed_job" => DelayedJobWeb, :anchor => false, :via => [:get, :post]

  devise_for :users

  namespace :api do
    post 'content' => 'content#sync'
  end
  resources :items
  resources :organisations, param: :slug
  resources :archives do 
    member do
      get :secret
    end
  end
  get 'wordpress' => 'pages#how'
  get 'mode-d-emploi' => 'pages#how', as: :how
  get ':organisation_slug' => 'direct#organisation', as: :direct_organisation
  get ':organisation_slug/:archive_slug' => 'direct#archive', as: :direct_archive
  get ':organisation_slug/:archive_slug/:item_id' => 'direct#item', as: :direct_item
  root 'pages#index'
end
