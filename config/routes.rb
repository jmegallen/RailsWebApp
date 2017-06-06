Rails.application.routes.draw do

  devise_for :users,  :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}, :controllers => {:registrations => "user_registrations"}
  
  resources :users

  resources :payments, only: [:new, :create]

  resources :products do
    resources :comments
  end

  resources :orders, only: [:index, :show, :create, :destroy]

  mount ActionCable.server => '/cable'
  
  get 'users/index'

  get 'payments/create'

  post 'payments/create'

  get 'static_pages/about'

  get 'static_pages/contact'

	get 'static_pages/landing_page'

  get 'static_pages/index'

  post 'static_pages/thank_you'

  root 'static_pages#landing_page'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end