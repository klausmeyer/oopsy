# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get :ping, to: ->(env) { ["200", {"Content-Type" => "text/plain"}, ["pong"]] }

  namespace :api do
    namespace :v3 do
      resources :projects, only: [] do
        resources :notices, only: [:create]
      end
    end
  end
end
