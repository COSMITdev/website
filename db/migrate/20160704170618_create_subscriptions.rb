class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :name, null: false, default: ''
      t.string :email, null: false, default: '', index: true

      t.timestamps null: false
    end
  end
end
