Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "users/registrations"}
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get "dashboard", to: "pages#programs_dashboard"
  resources :programs, except: :edit do
    delete 'programs/:id', to: 'programs#destroy', as: :delete_program
    collection do
      get :meals_options
    end

    get 'grocery', on: :member, to: 'programs#grocery'
    resources :meals, except: :show do
      resources :meal_assignments, only: %i[index create]
      post 'process_meals', on: :collection
    end
  end


  resources :meals, only: :show

end

# Defines the root path route ("/")
# root "posts#index"
