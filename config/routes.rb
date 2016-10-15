Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users, path: 'profile', path_names: { sign_up: 'register' },
             controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  devise_for :admin_users, path: 'admin', path_names: { sign_in: 'login' },
             controllers: { sessions: 'admin_users/sessions' }

  resource :user, path: 'profile', as: 'profile', only: [:show]

  match '/about', to: 'staticpages#about', via: 'get'
  match '/contact', to: 'staticpages#contact', via: 'get'

  resources :posts, only: [:show, :index]

  namespace :admin do
    get '', to: 'dashboard#index', as: :dashboard

    resources :posts
    resources :admin_users
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
