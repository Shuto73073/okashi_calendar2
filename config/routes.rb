Rails.application.routes.draw do
  # トップページ
  root "records#calendar"  
  
  # 記録機能（CRUD + カレンダー機能）
  resources :records do
    collection do
    get "calendar"
    end
  end


  # ユーザー登録
  get "signup", to: "users#new"
  resources :users, only: [:create]
  
  # ログイン・ログアウト
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

end