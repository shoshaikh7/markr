Rails.application.routes.draw do

  devise_for :users, :path => "accounts"
  
  resources :users do
  	collection { post :sort }
  	resources :articles do
  	end
  end

  get 'tags/:tag', to: 'articles#index', as: :tag
  
  root 'home#index'

end
