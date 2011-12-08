Ahdoc::Application.routes.draw do

  root :to => 'dashboard#index'

  devise_for :users
  resources :users

  get 'dashboard' => 'dashboard#index'

  resources :systems do
    resources :databases
    resources :groups
  end

  resources :databases do
    resources :tables
  end

  resources :tables do
    resources :fields
    resources :indices
    resources :constraints
  end

  resources :groups do
    resources :actors
    resources :documents
  end
  
  resources :documents do
    resources :preconditions
    resources :basic_flows
    resources :alternative_flows
    resources :posconditions
    resources :prototypes
  end
end
