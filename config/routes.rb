Rails.application.routes.draw do
	
  #resources :users
  resources :products
  resources :orders, only: [:index, :show, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'static_pages/about'

  get 'static_pages/contact'

	get 'static_pages/landing_page'

  get 'static_pages/index'

  #get '/products/:id', to: 'products#show'

  root 'static_pages#landing_page'

  # root 'products#index'

  # root 'orders#index'


end
