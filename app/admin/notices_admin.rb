Trestle.resource(:notices) do
  remove_action :new
  remove_action :create
  remove_action :destroy
  remove_action :update

  scopes do
    scope :received,     group: "State"
    scope :parsed,       group: "State", default: true
    scope :acknowledged, group: "State"

    Project.by_name.each do |p|
      scope p.id, -> { Notice.where(project: p) }, label: p.name, group: "Project"
    end
  end

  menu do
    item :notices, icon: "fa fa-bell", priority: 1
  end

  table do
    column :id
    column :project
    column :uuid, ->(notice) { notice.uuid[0, 7] }
    column :component, ->(notice) { notice.component }
    column :action, ->(notice) { notice.action }
    column :host, ->(notice) { notice.hostname }
    column :number_of_errors, ->(notice) { notice.error_occurrences.count }
    column :state do |notice|
      status_tag(notice.state)
    end
    column :created_at

    actions do |toolbar, instance, admin|
      case instance.state.to_sym
      when :parsed
        toolbar.link "Acknowledge", instance, action: :acknowledge, method: :put, style: :success, icon: "fa fa-check"
      when :acknowledged
        toolbar.link "Un-Acknowledge", instance, action: :unacknowledge, method: :put, style: :danger, icon: "fa fa-undo"
      end
    end
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

  controller do
    def acknowledge
      notice.acknowledge!

      flash[:message] = "Notice has been acknowledged"

      redirect_to admin.path(:index)
    end

    def unacknowledge
      notice.unacknowledge!

      flash[:message] = "Notice has been un-acknowledged"

      redirect_to admin.path(:index, scope: :acknowledged)
    end

    private

    def notice
      @notice ||= admin.find_instance(params)
    end
  end

  routes do
    put :acknowledge, on: :member
    put :unacknowledge, on: :member
  end
end
