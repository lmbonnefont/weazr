Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: "registrations"}
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'about', to: 'pages#about', as: :about
  get 'contact', to: 'pages#contact', as: :contact
  resources :companies do
    resources :inputs, only: [:new, :create, :update, :edit]
    resources :dashboards, only: [:show]
  end
  resource :profile, only: [:show, :edit, :update]
  resources :campaigns do
    resources :campaign_days, only: [:index]
  end
end
