Rails.application.routes.draw do

  devise_for :users, :path => "accounts"
  
  resources :users do
  	resources :articles
  end

  get 'tags/:tag', to: 'articles#index', as: :tag
  
  root 'home#index'

end
