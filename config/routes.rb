Rails.application.routes.draw do
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  namespace :admin do
    #注文詳細
    resources :order_details, only: [:update]
    #注文
    resources :orders, only: [:show, :update]
    #会員
    resources :customers, only: [:show, :edit, :index, :update]
    #ジャンル
    resources :genres, only: [:create, :edit, :index, :update]
    #商品
    resources :items, only: [:show, :edit, :index, :update, :new, :create]
    #ホーム画面
    get '/' => 'homes#top'
  end
  scope module: :public do
    #配送先
    resources :addresses, only: [:destroy, :edit, :index, :update, :create]
    #注文
    post 'orders/confirm'
    get 'orders/thanx'
    resources :orders, only: [:show, :index, :new, :crate]
    #カート内商品
    resources :cart_items, only: [:index, :update, :destroy, :create]
    delete 'cart_items' => 'cart_items#all_destroy'
    #商品
    resources :items, only: [:show, :index]
    #会員
    get '/customers', to: 'customers#show'
    get '/customers/informetion/edit', to: 'customers#edit'
    patch '/customers/informetion', to: 'customers#update', as: 'update_informetion'
    get 'customers/quit'
    patch 'customers/out'
    #ホーム画面
    root to: 'homes#top'
    get '/about' => 'homes#about'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
