Rails.application.routes.draw do
     
	devise_for :users, controllers: {
        	sessions: 'users/sessions',
		registrations: 'users/registrations'
        }

	devise_for :headhunters, controllers: {
        	sessions: 'headhunters/sessions',
		registrations: 'headhunters/registrations'
        }
  	root to: 'home#index'
end
