# rails g model Posts title:string content: string を実行することで自動生成
# migrateファイルが自動生成されたら、rails db:migrate を実行する
# モデル --> postsテーブルのレコードを操作するためのクラスを定義するためのもの

class Post < ApplicationRecord
end
