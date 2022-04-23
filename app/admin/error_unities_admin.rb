Trestle.resource(:error_unities) do
  remove_action :new
  remove_action :create
  remove_action :destroy
  remove_action :update

  menu do
    item :error_unities, icon: "fa fa-bug", priority: 2
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
    column :project
    column :error_type
    column :error_message
    column :created_at
  end

  # Customize the form fields shown on the new/edit views.
  #
  # form do |error_unity|
  #   text_field :name
  #
  #   row do
  #     col { datetime_field :updated_at }
  #     col { datetime_field :created_at }
  #   end
  # end

  form do |error_unity|
    tab :error_unity do
    end

    tab :error_occurrences, badge: error_unity.error_occurrences.count do
      table error_unity.error_occurrences, admin: :error_occurrences do
        column :id
        column :project
        column :notice do |error_occurrence|
          link_to "Notice (#{error_occurrence.notice.uuid[0, 7]})", notices_admin_path(error_occurrence.notice)
        end
        column :error_type
        column :error_message
        column :created_at
      end
    end
  end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:error_unity).permit(:name, ...)
  # end
end
