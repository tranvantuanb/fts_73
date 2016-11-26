Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "registrations"}
  root "static_pages#home"

  namespace :admin do
    root "home#index"
    resources :subjects, :questions, :users
    resources :statistic
  end

  namespace :api do
    resources :questions, only: :index
  end

  resources :exams
  get "/:page", to: "static_pages#show"
end
