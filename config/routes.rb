Rails.application.routes.draw do
  devise_for :users
  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'products#index'
  resources :products, only: %i[index show]
  resource :cart, only: [:show] do
    put 'add/:product_id', to: 'carts#add', as: :add_to
    put 'remove/:product_id', to: 'carts#remove', as: :remove_from
    put 'remove_one/:product_id', to: 'carts#removeone', as: :remove_one
  end

  namespace :admin do
    root to: 'products#index'
    resources :products, only: [:index, :new, :create, :edit, :update, :destroy]
  end
end
