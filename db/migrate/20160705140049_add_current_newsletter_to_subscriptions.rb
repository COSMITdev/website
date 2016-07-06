class AddCurrentNewsletterToSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :current_newsletter, :integer, null: false, default: '1'
  end
end
