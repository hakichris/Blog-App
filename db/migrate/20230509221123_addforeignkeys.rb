class Addforeignkeys < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :posts, :users, column: :author_id, index:true
    add_foreign_key :comments, :posts, column: :post_id, index:true
    add_foreign_key :comments, :users, column: :user_id, index:true
    add_foreign_key :likes, :users, column: :user_id, index:true
    add_foreign_key :likes, :posts, column: :post_id, index:true

  end
end
