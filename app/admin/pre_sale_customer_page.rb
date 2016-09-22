ActiveAdmin.register PreSaleCustomerPage do
  permit_params :slug, :banner, :video, :observation

  index do
    selectable_column
    id_column
    column :slug do |project|
      link_to project.slug, pre_sale_customer_page_path(project.slug), target: '_blank'
    end
    actions
  end

  show do
    attributes_table do
      row :slug do |project|
        link_to project.slug, pre_sale_customer_page_path(project.slug), target: '_blank'
      end
      row :banner do |project|
        image_tag project.banner.url, size: '300'
      end
      row :video
      row :observations
    end
  end

  form do |f|
    f.inputs do
      f.input :slug
      f.input :banner
      f.input :banner_cache, as: :hidden
      f.input :video
      f.input :observations
    end
    f.actions
  end
end
