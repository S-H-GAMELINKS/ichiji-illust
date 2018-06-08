Rails.application.routes.draw do
  root 'illusts#index'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :illusts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
