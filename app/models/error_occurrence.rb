class ErrorOccurrence < ApplicationRecord
  belongs_to :notice

  default_scope { order(id: :desc) }
end
