Rails.application.routes.draw do
  devise_for :headhunters
	devise_for :users
  	root to: 'home#index'
end
