Trestle.resource(:error_occurrences) do
  remove_action :new
  remove_action :create
  remove_action :destroy
  remove_action :update

  scopes do
    Project.by_name.each do |p|
      scope p.id, -> { ErrorOccurrence.where(project: p) }, label: p.name, group: "Project"
    end
  end

  menu do
    item :error_occurrences, icon: "fa fa-exclamation-circle", priority: 3
  end

  table do
    column :id
    column :project
    column :notice do |error_occurrence|
      link_to "Notice (#{error_occurrence.notice.uuid[0, 7]})", notices_admin_path(error_occurrence.notice)
    end
    column :error_type
    column :error_message
    column :created_at
  end

  form do |error_occurrence|
    tab :error_occurrence do
      text_field :error_type, readonly: true, disabled: true
      text_field :error_message, readonly: true, disabled: true
      datetime_field :created_at, readonly: true, disabled: true
      datetime_field :updated_at, readonly: true, disabled: true
    end

    tab :backtrace do
      backtrace :backtrace, readonly: true, disabled: true
    end
  end
end
