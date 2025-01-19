# rails g controller Posts

class PostsController < ApplicationController
  # routesのonlyで設定したアクションを定義

  # index(new)アクションに対して、index(new).html.erbという名前にする必要あり
  # Post: models(post.rb)で作成したクラス
  def index
    @posts = Post.all
  end

  # new: 新しいレコードを作成するためのフォームを表示
  def new
    @post = Post.new
  end

  # create: データをdbに保存
  def create
    @post = Post.new(post_params)
    if @post.save
      # posts_path: Rails で定義されているもの( rails routes で一覧できる)
      redirect_to posts_path
    else
      # new ビューを再描画
      render :new
    end
  end

  # private 修飾子以降に定義した関数は、このファイル内でしか呼び出せなくなる
  private
  def post_params
    # params.require(:post): リクエストから post というキーを取り出して、そのデータへのアクセスを許可
    # permit(:title, :content): postから、取り出すフィールドを指定。この場合、title と content のみ
    params.require(:post).permit(:title, :content)
  end
end
