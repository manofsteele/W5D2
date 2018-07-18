Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  
  resources :subs do
    resources :posts, only: [:new, :create, :edit, :update, :show] do 
      resources :comments, only: [:new, :create]
    end
  end

  resources :comments, only: [:show]
  resources :posts, only: :destroy
end
