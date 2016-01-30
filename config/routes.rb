Rails.application.routes.draw do
  
  resources :groups
  resources :user_groups
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

  get '/dashboard' => 'application#dashboard'
  get '/export_table_1' => 'application#export_table_1'
  get '/export_table_2' => 'application#export_table_2'
  root 'application#index'
end
