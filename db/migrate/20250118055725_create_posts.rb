# rails g model Posts title:string content:text を実行することで自動生成
# migrateファイル作成後に、rails db:migrate を実行する
class CreatePosts < ActiveRecord::Migration[8.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content

      # created_at と updated_at という2つのカラムを生成
      t.timestamps
    end
  end
end
