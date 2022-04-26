Trestle.resource(:users) do
  menu do
    item :users, icon: "fa fa-user", priority: 5
  end

  table do
    column :id
    column :email
    column :first_name
    column :last_name
  end

  form do |user|
    text_field :email
    text_field :first_name
    text_field :last_name
    password_field :password
    password_field :password_confirmation
  end
end
