Rails.application.routes.draw do

  namespace :admin do
    get 'items/index'
    get 'items/new'
    get 'items/create'
    get 'items/show'
    get 'items/edit'
    get 'items/update'
  end
  #管理者側の認証用ルーティング
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }
  #お客さん用の認証用ルーティング
  devise_for :customers,
  path: '',
  path_names: {
    sign_up: '',
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup',
  },
  controllers: {
    sessions: 'customers/sessions',
    passwords: 'customers/passwords',
    registrations: 'customers/registrations'
  }

  #会員側のページ
  scope module: :public do
    resources :customers
    resources :items
    root to: 'homes#top'
    get 'about' => 'homes#about'
  end

  #管理者側のページ
  namespace :admin do
    resources :customer
    get 'top' => 'homes#top'
  end

  #会員側のurlからpublicを無くす
  scope module: :public do
    get 'index' => 'products#index'

  end

end
