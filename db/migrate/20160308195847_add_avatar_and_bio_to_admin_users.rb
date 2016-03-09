class AddAvatarAndBioToAdminUsers < ActiveRecord::Migration
  def change
    add_column :admin_users, :avatar, :string, null: false, default: ""
    add_column :admin_users, :bio, :string, null: false, default: ""
  end
end
