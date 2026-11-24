Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :procedures do
   resources :check_lists, only: [:create]
  end
end
