Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  devise_for :users
  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
 resources :posts do
  resources :reviews
 end
 root 'posts#index'
 get '/posts/topposts' => 'posts#topposts'

 get '/users' => 'users#index' 
end
