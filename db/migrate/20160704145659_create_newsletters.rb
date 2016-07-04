class CreateNewsletters < ActiveRecord::Migration
  def change
    create_table :newsletters do |t|
      t.string :subject, null: false, default: ''
      t.text :body, null: false, default: ''

      t.timestamps null: false
    end
  end
end
