# frozen_string_literal: true

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
  resources :job_opportunities do
    get 'search', on: :collection
    resources :apply_jobs, except: [:index] do
      resources :feedbacks, only: %i[new create edit update]
      get 'profile_as', to: 'candidates#profile_as'
    end
  end
  resources :job_opportunities do
    resources :interviews, only: [:show]
    resources :candidates do
      resources :interviews, except: %i[index show]
    end
  end

  resources :candidates do
    get 'search', on: :collection
    resources :comments, except: %i[index show]
    resources :proposals do
      resources :awnser_proposals
    end
  end

  resources :apply_jobs, only: [:index]
  resources :interviews, only: [:index]
end
