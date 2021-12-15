Rails.application.routes.draw do
	resources :memberships, only: [:create]
	resources :gyms, only: %i[index show update destroy]
	resources :clients, only: %i[index show update]
	# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
