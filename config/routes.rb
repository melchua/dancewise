# frozen_string_literal: true

Rails.application.routes.draw do
  mount ForestLiana::Engine => '/forest'
  resources :artist_statuses
  resources :event_statuses
  resources :event_frequencies
  resources :event_statuses
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :articles # , only: [:show, :index, :new, :create, :edit, :update, :destroy]
  get 'signup', to: 'users#new'
  # post 'users', to: 'users#create'
  resources :users, except: [:new]
  resources :events
  get '/suggest_event', to: 'events#suggest_event', as: 'suggest_event'
  get '/suggest_artist', to: 'artists#suggest_artist', as: 'suggest_artist'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :dance_styles, except: [:destroy]
  resources :artists
  resources :event_types
end
