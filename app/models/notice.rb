class Notice < ApplicationRecord
  has_many :error_occurrences

  default_scope { order(id: :desc) }
end
