Ahdoc::Application.routes.draw do
  resources :systems do
    resources :databases
    resources :groups
  end

  root :to => 'dashboard#index'

  devise_for :users
  resources :users

  get 'dashboard' => 'dashboard#index'

  resources :alternative_flows do
    resources :items
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
