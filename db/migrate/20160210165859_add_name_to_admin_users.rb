class AddNameToAdminUsers < ActiveRecord::Migration
  def change
    add_column :admin_users, :name, :string, null: false, default: 'Admin'
  end
end
