Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]  
  get 'signup', to: 'users#new', as: 'signup'  
  get 'login', to: 'sessions#new', as: 'login'  
  get 'logout', to: 'sessions#destroy', as: 'logout'
  
  resources :users

  resources :projects do
    resources :stages do
      resources :tasks
      # resources :tasks, shallow: true
    end
  end
  # get '/tasks', to: 'tasks#index'
  resources :stages
  resources :tasks
  get 'filter_stages_by_project', to: 'projects#filter_stages_by_project'

  # resources :tasks

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "projects#index"
end
