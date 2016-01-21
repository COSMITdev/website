class CreatePortfolioPhotos < ActiveRecord::Migration
  def change
    create_table :portfolio_photos do |t|
      t.references :portfolio, index: true, foreign_key: true
      t.string :description
      t.string :photo

      t.timestamps null: false
    end
  end
end
