class ErrorOccurrence < ApplicationRecord
  belongs_to :project
  belongs_to :notice
  belongs_to :error_unity, optional: true

  default_scope { order(id: :desc) }
end
