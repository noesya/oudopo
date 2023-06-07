Rails.application.routes.draw do
  get 'wordpress' => "pages#wordpress"
  root "pages#index"
end
