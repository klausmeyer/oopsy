Trestle.resource(:notices) do
  remove_action :new
  remove_action :create
  remove_action :destroy
  remove_action :update

  menu do
    item :notices, icon: "fa fa-bell", priority: 4
  end

  table do
    column :id
    column :project
    column :uuid, ->(notice) { notice.uuid[0, 7] }
    column :component, ->(notice) { notice.component }
    column :action, ->(notice) { notice.action }
    column :host, ->(notice) { notice.hostname }
    column :number_of_errors, ->(notice) { notice.error_occurrences.count }
    column :created_at
  end

  form do |notice|
    tab :notice do
      text_field :uuid, readonly: true
      json :context, readonly: true
      json :session, readonly: true
      json :environment, readonly: true
      json :params, readonly: true
      datetime_field :created_at, readonly: true, disabled: true
      datetime_field :updated_at, readonly: true, disabled: true
    end

    tab :error_occurrences, badge: notice.error_occurrences.count do
      table notice.error_occurrences, admin: :error_occurrences do
        column :id
        column :project
        column :notice do
          link_to "Notice (#{notice.uuid[0, 7]})", notices_admin_path(notice)
        end
        column :error_type
        column :error_message
        column :created_at
      end
    end
  end
end
