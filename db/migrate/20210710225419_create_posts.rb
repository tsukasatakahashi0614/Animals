class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false
      t.text :body, null: false
      t.integer :image_id, null: false
      t.integer :genre_id

      t.timestamps
    end
  end
end
