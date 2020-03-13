Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show] do 
    resources :tweets, only: [:index]
  end

  resources :tweets
  resources :users

end
