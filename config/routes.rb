Rails.application.routes.draw do
  
  devise_for :admins
  
  
  resources :departments do
  	resources :users do
  		resources :user_budgets
  	end
  end

  resources :asset_manages do
    resources :logs
  	get '/in' => 'asset_manages#in'
  	get '/out' => 'asset_manages#out'
  end


  root 'application#index'
end
