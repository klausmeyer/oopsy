Trestle.resource(:projects) do
  remove_action :destroy

  menu do
    item :projects, icon: "fa fa-code-branch", priority: 4
  end

  table do
    column :id
    column :name
    column :api_key
    column :created_at
  end

  form do |project|
    text_field :name
    text_field :api_key, readonly: project.persisted?, disabled: project.persisted?
    datetime_field :created_at, readonly: true, disabled: true
    datetime_field :updated_at, readonly: true, disabled: true
  end
end
