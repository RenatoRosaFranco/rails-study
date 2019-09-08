# frozen_string_literal: true

Rails.application.routes.draw do
  
  # Commentable
  # @implemented
  concern :commentable do
  	resources :comments, only: [:create, :destroy]
  	collection do
  		get  'search'
  	end
  end

  # Likeable
  # @implemented
  concern :likeable do
  	resources :likes, only: [:create, :destroy]
  	collection do
  		get  'search'
  	end
  end

  # Favoritable
  # @implemented
  concern :favoritable do
  	resources :favorites, only: [:create, :destroy]
 		collection do 
 			get  'search'
 		end
  end

  # Scope
  # @implemented
  scope :team do
  	resources :peoples do
  		resources :tasks, concerns: [:commentable]
  	end
  end

  # API
  # @implemented
  namespace :api, constraint: { subdomain: 'api' } do
  	
  	# V1
  	# @implemented
  	namespace :v1 do
  		defaults format: :json do
  			resources :tasks
  		end
  	end

  	# V2
  	# @implemented
  	namespace :v2 do
  		defaults format: :xml do
  			resources :tasks
  		end
  	end
  end

  # Routes
  # @implemented
  resources :pets, concerns: [:commentable, :likeable, :favoritable]
  resources :authors
  resources :books, concern: [:commetable, :likeable,  :favoritable]
end
