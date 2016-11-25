Rails.application.routes.draw do
  devise_for :users


	get 'users/sign_in'
	get 'users/sign_up'
	get 'users/sign_out' => 'users/index'
	get 'users/auth'
	get 'users/profile'
	get 'contacts/destroy'
	resources :users 
	    
	resources :profiles

	resources :contacts
	resources :addresses
    root to: "users#auth"
	
	
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
