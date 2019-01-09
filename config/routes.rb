Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/assigns/students/:id", to: "assigns#new"
  get "/assigns/instructors/:id", to: "assigns#new"
  get "/assigns/students/:id/edit", to: "assigns#edit"
  get "/assigns/instructors/:id/edit", to: "assigns#edit"
  post "/assigns/students/:id", to: "assigns#update"
  post "/assigns/instructors/:id", to: "assigns#update"

  root :to => "home#index"

  resources :home
    get "/home/login", to: "home#login"
    post "/home/login", to: "home#login"
  resources :users
  resources :students
  resources :instructors
  resources :courses
  resources :cohorts
end





# Rails.application.routes.draw do
#   resources :passwords, controller: "clearance/passwords", only: [:create, :new]
#   resource :session, controller: "clearance/sessions", only: [:create]
#
#   resources :users, controller: "clearance/users", only: [:create] do
#     resource :password,
#       controller: "clearance/passwords",
#       only: [:create, :edit, :update]
#   end
#
#   get "/sign_in" => "clearance/sessions#new", as: "sign_in"
#   delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
#   get "/sign_up" => "clearance/users#new", as: "sign_up"
#   resources :passwords, controller: "clearance/passwords", only: [:create, :new]
#   resource :session, controller: "clearance/sessions", only: [:create]
#
#   resources :users, controller: "users", only: [:create] do
#     resource :password,
#       controller: "clearance/passwords",
#       only: [:create, :edit, :update]
#   end
#
#   get "/sign_in" => "clearance/sessions#new", as: "sign_in"
#   delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
#   get "/sign_up" => "clearance/users#new", as: "sign_up"
#   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# end
