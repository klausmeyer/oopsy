Trestle.resource(:projects) do
  remove_action :destroy

  menu do
    item :projects, icon: "fa fa-star", priority: 1
  end

  # Customize the table columns shown on the index view.
  #
  # table do
  #   column :name
  #   column :created_at, align: :center
  #   actions
  # end

  table do
    column :id
    column :name
    column :api_key
    column :created_at
  end

  # Customize the form fields shown on the new/edit views.
  #
  # form do |project|
  #   text_field :name
  #
  #   row do
  #     col { datetime_field :updated_at }
  #     col { datetime_field :created_at }
  #   end
  # end

  form do |project|
    text_field :name
    text_field :api_key, readonly: project.persisted?, disabled: project.persisted?
    datetime_field :created_at, readonly: true, disabled: true
    datetime_field :updated_at, readonly: true, disabled: true
  end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:project).permit(:name, ...)
  # end
end
