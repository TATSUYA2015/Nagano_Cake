Rails.application.routes.draw do

  namespace :public do
    root to: 'homes#top'
    get 'home/about' => 'homes#about', as: 'about'
    resources :customers, only:[:show, :edit, :update]
    #退会画面
    get 'customers/:id/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    #論理削除用のルーティング
    patch 'customers/:id/withdrawal' => 'customers#withdrawal', as: 'customers_withdrawal'
    resources :addresses, only:[:index, :create, :edit, :update, :destroy]
  end


  namespace :admin do
    get 'homes/top'
    resources :items, only:[:new, :index, :show, :edit, :create, :update]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :genres, only:[:index, :create, :edit, :update]
    resources :addresses, only:[:index, :edit, :create, :update, :destroy]
    resources :orders, only:[:show, :update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

end
