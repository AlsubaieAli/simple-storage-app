Rails.application.routes.draw do
  root to: "hello_world#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  scope '/v1' do
    get '/storage_options', to: 'storage_options#index'

    scope '/blobs' do
      get '/', to: 'storage_records#index'
      get '/:id', to: 'storage_records#show', as: :show_blob
      post '/', to: 'storage_records#create'
    end

    scope '/app_configs' do
      get '/', to: 'app_configs#index'
      put '/', to: 'app_configs#update'
    end
  end
end
