Rails.application.routes.draw do
  namespace :admin do
    resources :products
    resources :categories do
      collection do
          get :manage
          post :rebuild
      end
    end
  end
  namespace :users do
    get 'omniauth_callbacks/facebook'
    get 'omniauth_callbacks/google_oauth2'
  end

  mount Ckeditor::Engine => '/ckeditor'
  resources :pictures
  resources :products
  root to: 'visitors#index'
  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks"}
  resources :users
  resources :feedbacks
  resources :questions

end
