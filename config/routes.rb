Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  patch '/update_user', to: 'profiles#update', as: 'update_user'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
