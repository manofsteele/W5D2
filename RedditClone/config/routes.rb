Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  
  resources :subs do
    resources :posts, only: [:new, :create, :edit, :update, :show]
  end

  resources :posts, only: :destroy
end
