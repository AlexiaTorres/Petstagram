ActiveAdmin.register Pet do
  permit_params :name, :birthday, :description, :email, :avatar

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :birthday
    column :email
    column :avatar
    actions
  end

  filter :name
  filter :description
  filter :birthday
  filter :email

  show do |pet|
    attributes_table do
      row :id
      row :name
      row :description
      row :birthday
      row :email
      row :avatar do
        image_tag pet.avatar.url(:thumb)
      end
      row :sign_in_count
      row :last_sign_in_at
    end

  end

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :name
      f.input :description
      f.input :email
      f.input :birthday
    end

    f.inputs "Image" do
      f.input :avatar, as: :file
    end

    f.actions
  end

end

