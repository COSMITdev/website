class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :hero_image
      t.string :title
      t.text :body
      t.string :slug, unique: true
      t.date :publish_date
      t.integer :author_id, index: true
      t.string :meta_title
      t.string :meta_description

      t.timestamps null: false
    end
  end
end
