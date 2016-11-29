Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "registrations"}
  root "exams#index"

  namespace :admin do
    root "home#index"
    resources :subjects, :questions, :users, :exams
    resources :statistic
  end

  namespace :api do
    resources :questions, only: :index
  end

  resources :exams
  get "/:page", to: "static_pages#show"
end
