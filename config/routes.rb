Rails.application.routes.draw do
  # resources :posts --> postsというデータに対してRESTfulなルートを定義
  # only: [] --> []内のアクション(ルート)のみを生成
  # http://localhost:3000/posts のURLでindex.html.erbが表示される
  # http://localhost:3000/posts/new のURLでnew.html.erbが表示される
  # http://localhost:3000/posts/create のURLでcreate.html.erbが表示される
  resources :posts, only: [:index, :new, :create, :edit, :update, :destroy]
end