Rails.application.routes.draw do
  resources :fuel_supplies do
    collection do
      get '/report' =>'fuel_supplies#report', as: :report
    end
  end
  resources :vehicles
  # get 'pages/home'
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
end
