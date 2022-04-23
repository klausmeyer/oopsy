class Notice < ApplicationRecord
  belongs_to :project
  has_many :error_occurrences

  default_scope { order(id: :desc) }

  validates :project, presence: true
end
