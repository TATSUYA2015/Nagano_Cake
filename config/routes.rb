Rails.application.routes.draw do


  namespace :public do
    get 'home/about' => 'homes#about', as: 'about'
  end


  namespace :admin do
    resources :items, only:[:new, :index, :show, :edit, :create, :update]
    resources :customers, only:[:index, :show, :edit, :update]
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
