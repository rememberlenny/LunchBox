Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'static_pages#home'

  # User related
  devise_for :users, :controllers => {
    omniauth_callbacks: 'omniauth_callbacks',
    registrations: 'registrations'
  }
  match '/users/:id/deactivate'     => 'users#deactivate_user', via: [:get, :patch, :post], :as => :deactivate_user
  match '/users/:id/finish_signup'  => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup

  # Static pages
  get 'about'   => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'setup'   => 'users#setup'

end
