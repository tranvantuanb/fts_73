Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "registrations",
    sessions: "sessions"}
  resources :users, only: :show

  root "exams#index"

  namespace :admin do
    root "admins#index", as: :root
    resources :subjects, :questions, :users, :exams
    resources :statistic
  end

  namespace :api do
    resources :questions, only: :index
  end

  resources :exams
  get "/:page", to: "static_pages#show"
end
