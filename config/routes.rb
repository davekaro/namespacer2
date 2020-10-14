Rails.application.routes.draw do
  namespace :webinars do
    resources :positions
  end
  resources :webinars
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
