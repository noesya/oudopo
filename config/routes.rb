Rails.application.routes.draw do
  devise_for :users
  get 'wordpress' => "pages#wordpress"
  root "pages#index"
end
