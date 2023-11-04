require "sidekiq/web"

Rails.application.routes.draw do
  root to: redirect("/web")

  mount Trestle::Engine, at: "/web"

  get :ping, to: ->(env) { ["200", {"Content-Type" => "text/plain"}, ["pong"]] }

  namespace :api do
    namespace :v3 do
      resources :projects, only: [] do
        resources :notices, only: [:create]
      end
    end
  end
end
