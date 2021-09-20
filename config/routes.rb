Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :user_informations
      resources :user_changes
      resources :maps
      resources :users
      resources :test
      resources :contacts
      resources :corporate_informations
      resources :corporates
      resources :permissions
      resources :property_informations
      resources :property_users
      resources :propieties
      resources :status_disponibilities
      resources :tenant_histories
      resources :tenant_users
      resources :dashboard
      resources :user_rol
      resources :user_rol_permission
      resources :update
      resources :rescue_user_information
      resources :update_user 
      put "update_publish", to: "property_informations#update_publish"
      get "get_update_publish", to: "property_informations#get_update_publish"
      devise_scope :user do
        post "sign_up", to: "registrations#create"
        put "update_user", to: "registrations#update"
        post "sign_in", to: "sessions#create"
        get "logout", to: "sessions#destroy"
      end
      resources :documents
      resources :upload_image
      resources :get_property
      resources :search_image
      resources :corporate_image
    end
  end
end
