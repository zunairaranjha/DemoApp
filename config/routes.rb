Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
 resources :posts do
  resources :reviews
 end
 root 'posts#index'
end
