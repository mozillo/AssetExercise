Rails.application.routes.draw do
  resources :asset_manages


  root 'asset_manages#index'
end
