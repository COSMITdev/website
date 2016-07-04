ActiveAdmin.register Newsletter do
  permit_params :subject, :body

  form do |f|
    f.inputs do
      f.input :subject
      f.input :body, as: :html_editor
    end

    f.actions
  end
end
