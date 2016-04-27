ActiveAdmin.register Post do
  permit_params :hero_image, :title, :body, :slug, :publish_date, :author_id,
                :meta_title, :meta_description, :tag_list, :published, :hero_image_cache,
                :meta_tags

  index do
    selectable_column
    column :published
    id_column
    column :slug
    column :title
    column :author
    column :publish_date
    actions
  end

  show do
    attributes_table do
      row :hero_image do |post|
        image_tag post.hero_image.url, size: '300'
      end
      row :title
      row :slug
      row :publish_date do |post|
        l post.publish_date if post.publish_date
      end
      row :author
      row :meta_title
      row :meta_description
      row :tag_list
      row :meta_tags
      row :body do |post|
        markdown(post.body).html_safe
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :published
      f.input :language, as: :select, collection: I18n.available_locales.map{|lang| lang.to_s}, include_blank: false
      f.input :hero_image
      f.input :hero_image_cache, as: :hidden
      f.input :title
      f.input :body
      f.input :slug
      f.input :publish_date, as: :datepicker
      f.input :author, as: :select, collection: AdminUser.pluck(:email, :id), include_blank: false
      f.input :meta_title
      f.input :meta_description
      f.input :tag_list, input_html: { value: f.object.tag_list.join(', ') }
      f.input :meta_tags
    end
    f.actions
  end
end
