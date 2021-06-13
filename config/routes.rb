Rails.application.routes.draw do
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
  namespace :public do
    resources :customer
    get 'top' => 'homes#top'
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
