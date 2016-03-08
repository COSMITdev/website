ActiveAdmin.register AdminUser do
  permit_params :name, :email, :password, :password_confirmation, :avatar,
                :avatar_cache, :bio

  controller do
    def update
      if params[:admin_user][:password].blank?
        params[:admin_user].delete("password")
        params[:admin_user].delete("password_confirmation")
      end
      super
    end
  end

  index do
    selectable_column
    id_column
    column :avatar do |admin|
      image_tag admin.avatar.url, size: '100x100' if admin.avatar.present?
    end
    column :name
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :name
  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  show do
    attributes_table do
      row :avatar do |admin|
        image_tag admin.avatar.url, size: '200'
      end
      row :name
      row :email
      row :bio
    end
  end

  form do |f|
    f.inputs "Admin Details" do
      f.input :avatar
      f.input :avatar_cache, as: :hidden
      f.input :name
      f.input :email
      f.input :bio
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
