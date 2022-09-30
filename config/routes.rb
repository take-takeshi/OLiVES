Rails.application.routes.draw do
  namespace :admin do
    root to: 'home#index'
    resources :conferences, only: [ :create, :destroy, :edit, :update ]
    resources :days, only: [ :edit, :update ]
    resources :tracks, only: [ :edit, :update ]
    resources :slots, only: [ :create, :destroy, :edit, :update ]
  end

  #namespace :admin do の外に書くことでdeleteを実行させる
  get 'admin/conferences/:id' => 'admin/conferences#destroy'
  get 'admin/slots/:id' => 'admin/slots#destroy'
  
  get 'participations/create'
  get 'participations/destroy'
  
  namespace :mypage do
    get 'users/show'
    get 'users/edit'
    get 'users/update'
    root to:  'home#index'
    resources :users, only: [ :show, :update, :edit ]
  end

  devise_for :users,controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }

  root to: 'conferences#index'

  resources :conferences, only: [ :show, :index ]
  resources :days, only: [ :show ]
  resources :slots, only: [ :show ]
  resources :participations, only: [ :create, :destroy ]

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
