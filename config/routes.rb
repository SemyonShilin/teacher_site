Rails.application.routes.draw do
  root 'staticpages#home'

  devise_for :users, path: 'profile', path_names: { sign_up: 'register', sign_in: 'login', sign_out: 'logout' },
             controllers: { sessions: 'users/sessions', registrations: 'users/registrations', passwords: 'users/passwords',
             confirmations: 'users/confirmations', unlocks: 'users/unlocks'}

  devise_for :admin_users, path: 'admin', path_names: { sign_in: 'login' },
             controllers: { sessions: 'admin_users/sessions' }

  resource :users, path: 'profile', as: 'profile', only: [:show]

  match '/about', to: 'staticpages#about', via: [:get]
  match '/contact', to: 'staticpages#contact', via: [:get]
  match 'feedback' => 'users#feedback', as: :feedback, via: [:post]

  resources :posts, only: [:show, :index] do
    resources :comments
  end

  resources :images, only: [:show, :index]

  namespace :admin do
    get '', to: 'dashboard#index', as: :dashboard

    resources :posts
    resources :admin_users
    resources :images
    resources :users do
      put :ban, on: :member
    end
    resources :feedbacks, only: [:index, :show, :edit, :update] do
      post :reply, on: :member
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
