Trestle.resource(:error_occurrences) do
  remove_action :create
  remove_action :destroy
  remove_action :update

  menu do
    item :error_occurrences, icon: "fa fa-star"
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
    column :error_type
    column :error_message
    column :created_at
  end

  # Customize the form fields shown on the new/edit views.
  #
  # form do |error_occurrence|
  #   text_field :name
  #
  #   row do
  #     col { datetime_field :updated_at }
  #     col { datetime_field :created_at }
  #   end
  # end

  form do |error_occurrence|
    text_field :error_type, readonly: true
    text_field :error_message, readonly: true
    text_area :backtrace, readonly: true
    text_field :created_at, readonly: true
    text_field :updated_at, readonly: true
  end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:error_occurrence).permit(:name, ...)
  # end
end
