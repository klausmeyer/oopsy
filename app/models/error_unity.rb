class ErrorUnity < ApplicationRecord
  belongs_to :project
  has_many :error_occurrences

  default_scope { order(id: :desc) }
end
