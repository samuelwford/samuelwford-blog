class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.datetime :posted_at
      t.text :body
      t.boolean :published

      t.timestamps null: false
    end
  end
end
