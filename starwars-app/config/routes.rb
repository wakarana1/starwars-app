Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'landing#index'

  scope '/api' do
    resources :landing
    resources :films
    resources :people
    resources :planets
    resources :species
    resources :starships
    resources :vehicles
  end
end
