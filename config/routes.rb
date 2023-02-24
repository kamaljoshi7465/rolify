Rails.application.routes.draw do
  devise_for :students
  # devise_for :admin_users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :students 
  resources :accounts
  resources :courses
  resources :animals
  devise_scope :student do
    get 'password', to:'devise/passwords#edit' ,as: :edit_password
    patch 'password', to:'devise/passwords#update'
    get 'sign_up',to:'devise/registrations#new'
    post 'sign_up',to:'devise/registrations#create'
    get 'sign_in',to:'devise/sessions#new'
    post 'sign_in',to:'devise/sessions#create'
    get 'password/reset' ,to:'devise/password_resets#new'
    post 'password/reset' ,to:'devise/password_resets#create'
    get 'password/reset/edit' ,to:'devise/password_resets#edit'
    patch 'password/reset/edit' ,to:'devise/password_resets#update'
    delete 'log_out', to: 'devise/sessions#destroy'
    get 'student',to: 'students#new'
    post 'student',to: 'students#create'
  end
  namespace :api do 
    namespace :v1 do 
      resources :students 
      resources :courses 
      resources :animals
      resources :accounts
    end 
  end
end
