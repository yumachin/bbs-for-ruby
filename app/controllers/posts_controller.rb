# rails g controller Posts

class PostsController < ApplicationController
  # routesのonlyで設定したアクションを定義

  before_action :set_post, only: [:edit, :update, :destroy]
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
      # posts_path: Rails で定義されているもの( rails routes | grep posts で一覧できる)
      redirect_to posts_path
    else
      # new ビューを再描画
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  # private 修飾子以降に定義した関数は、このファイル内でしか呼び出せなくなる
  private
  # パラメーターはここに記述する
  def post_params
    # form_withを使ったフォームを作成すると、model: post の部分で定義した変数(post)がキーとしてサーバに送られる
    # params.require(:post): リクエストから post というキーを取り出して、そのデータへのアクセスを許可
    # permit(:title, :content): postから、取り出すフィールドを指定。この場合、title と content のみ
    params.require(:post).permit(:title, :content)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
