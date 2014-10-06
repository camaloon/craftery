Craftery::Application.routes.draw do

  get "login" => 'session#new'
  post "login" => 'session#create'
  delete "logout" => 'session#destroy'

  get "signup" => 'users#new'

  resources :users, only: [:create]

  resources :projects do
    resources :personas, except: [:show, :destroy]

    resources :features do
      resources :user_stories
    end
  end

  root 'home#home'
end
