Rails.application.routes.draw do
	Rails.application.routes.default_url_options[:host] = 'https://night-thoughts.herokuapp.com'

	devise_for :users
	# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
	resources :profiles
	resources :likes

	namespace :api do
	    namespace :v1 do
	      resources :profiles, only: [:index, :show, :create, :destroy]
	      resources :hashtag
	      resources :users, only: [:create, :index]
	      resources :likes
	    end
	end

		
	root to: "users#index"
end
