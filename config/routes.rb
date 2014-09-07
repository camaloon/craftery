Craftery::Application.routes.draw do

  get "login" => 'session#new'
  post "login" => 'session#create'
  delete "logout" => 'session#destroy'

  get "signup" => 'users#new'
  resources :users, only: [:create]

  shallow do
    resources :projects do
      resources :personas
      resources :features do
        resources :business_goals
        resources :user_stories do
          resources :acceptance_criteria
        end
      end
    end
  end

  root 'home#home'
end
