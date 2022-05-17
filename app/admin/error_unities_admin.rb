Trestle.resource(:error_unities) do
  remove_action :new
  remove_action :create
  remove_action :destroy
  remove_action :update

  scopes do
    Project.by_name.each do |p|
      scope p.name, -> { ErrorUnity.where(project: p) }, label: p.name, group: "Project"
    end
  end

  menu do
    item :error_unities, icon: "fa fa-bug", priority: 2
  end

  table do
    column :id
    column :project
    column :error_type
    column :error_message
    column :number_of_occurrences, ->(error_unity) { error_unity.error_occurrences.count }
    column :created_at
  end

  form do |error_unity|
    tab :error_unity do
      text_field :error_type, readonly: true
      text_field :error_message, readonly: true
      datetime_field :created_at, readonly: true, disabled: true
      datetime_field :updated_at, readonly: true, disabled: true
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
end
