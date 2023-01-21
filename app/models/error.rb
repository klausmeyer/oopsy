class Error < ApplicationRecord
  belongs_to :notice
  has_one :project, through: :notice
  belongs_to :error_group, optional: true

  default_scope { order(id: :desc) }
end
