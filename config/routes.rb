Azurie::Application.routes.draw do
  resources :briefings

  get "pages/index", :as => :root

  get "pages/about", :as => :about

  resources :questions do
    resources :answers
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" } do
    get '/users/auth/:provider' => 'users/omniauth_callbacks#passthru'
  end

  resources :users

  root :to => "pages#index"
end
