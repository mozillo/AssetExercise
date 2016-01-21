Rails.application.routes.draw do
  
  devise_for :admins
  resources :logs
  
  resources :departments do
  	resources :users do
  		resources :user_budgets
  	end
  end

  resources :asset_manages


  root 'departments#index'
end
