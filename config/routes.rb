Rails.application.routes.draw do
  
  devise_for :admins
  
  
  resources :departments do
  	resources :users
  end

  resources :asset_manages do
    resources :logs
  	get '/in' => 'asset_manages#in'
  	get '/out' => 'asset_manages#out'
  end
  
  resources :logs

  root 'application#index'
end
