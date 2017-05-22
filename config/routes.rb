Rails.application.routes.draw do

  devise_scope :user do
    get "/sign_in" => "devise/sessions#new" # custom path to login/sign_in
    get "/sign_up" => "users#new", as: "new_user_registration" # custom path to sign_up/registration
  end
  devise_for :users, :skip => [:registrations]                                          
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'    
    put 'users' => 'devise/registrations#update', :as => 'user_registration'            
  end


  resources :users
  #resources :users
  resources :products
  resources :orders, only: [:index, :show, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'static_pages/about'

  get 'static_pages/contact'

	get 'static_pages/landing_page'

  get 'static_pages/index'

  post 'static_pages/thank_you'

  get 'static_pages/thank_you'

  #get '/products/:id', to: 'products#show'

  root 'static_pages#landing_page'

  # root 'products#index'

  # root 'orders#index'


end
