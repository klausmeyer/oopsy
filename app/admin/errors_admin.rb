Trestle.resource(:errors) do
  remove_action :new
  remove_action :create
  remove_action :destroy
  remove_action :update

  scopes do
    Project.by_name.each do |p|
      scope p.name, -> { Error.joins(:notice).where("notices.project_id = ?", p.id) }, label: p.name, group: "Project"
    end
  end

  menu do
    item :errors, icon: "fa fa-exclamation-circle", priority: 2
  end

  table do
    column :id
    column :project
    column :notice do |error|
      link_to "Notice##{error.notice_id}", notices_admin_path(error.notice)
    end
    column :error_type
    column :error_message
    column :created_at
  end

  form do |error|
    tab :error do
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
