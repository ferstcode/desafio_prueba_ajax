Rails.application.routes.draw do
  resources :posts do 
    resources :comments, only: %i[create]
  end

  devise_for :users

  get 'busqueda', to: 'posts#busqueda'
  
  root 'posts#index'
end
