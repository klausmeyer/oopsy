Trestle.resource(:error_groups) do
  remove_action :new
  remove_action :create
  remove_action :destroy
  remove_action :update

  scopes do
    Project.by_name.each do |p|
      scope p.name, -> { ErrorGroup.where(project: p) }, label: p.name, group: "Project"
    end
  end

  menu do
    item :error_groups, icon: "fa fa-bug", priority: 3
  end

  table do
    column :id
    column :project
    column :name
    column :number_of_errors, ->(group) { group.grouped_errors.count }
    column :created_at
  end

  form do |error_group|
    tab :error_group do
      text_field :name, readonly: true
      datetime_field :created_at, readonly: true, disabled: true
      datetime_field :updated_at, readonly: true, disabled: true
    end

    tab :errors, badge: error_group.grouped_errors.count do
      table error_group.grouped_errors, admin: :errors do
        column :id
        column :project
        column :notice do |error|
          link_to "Notice (#{error.notice.uuid[0, 7]})", notices_admin_path(error.notice)
        end
        column :error_type
        column :error_message
        column :created_at
      end
    end
  end
end
