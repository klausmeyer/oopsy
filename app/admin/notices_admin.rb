Trestle.resource(:notices) do
  remove_action :new
  remove_action :create
  remove_action :destroy
  remove_action :update

  menu do
    item :notices, icon: "fa fa-star", priority: :first
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
    column :action, ->(notice) { notice.context["action"] }
    column :component, ->(notice) { notice.context["component"] }
    column :session, ->(notice) { notice.session["session_id"] }
    column :number_of_errors, ->(notice) { notice.error_occurrences.count }
    column :created_at
  end

  # Customize the form fields shown on the new/edit views.
  #
  # form do |notice|
  #   text_field :name
  #
  #   row do
  #     col { datetime_field :updated_at }
  #     col { datetime_field :created_at }
  #   end
  # end

  form do |notice|
    tab :notice do
      json :context, readonly: true
      json :session, readonly: true
      json :environment, readonly: true
      json :params, readonly: true

      text_field :created_at, readonly: true
      text_field :updated_at, readonly: true
    end

    tab :error_occurrences, badge: notice.error_occurrences.count do
      table notice.error_occurrences, admin: :error_occurrence do
        column :id
        column :error_type
        column :error_message
        column :created_at
      end
    end

    tab :debug do
      json :raw, readonly: true
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
  #   params.require(:notice).permit(:name, ...)
  # end
end
