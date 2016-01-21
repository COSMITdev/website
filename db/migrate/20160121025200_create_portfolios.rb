class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
      t.text :body
      t.string :slug
      t.string :logo
      t.string :cover
      t.string :title
      t.string :working_time_type
      t.integer :working_time

      t.timestamps null: false
    end
  end
end
