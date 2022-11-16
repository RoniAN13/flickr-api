Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
get 'static_pages/home', to: 'static_pages#home'
  # Defines the root path route ("/")
   root "static_pages#home"
end
