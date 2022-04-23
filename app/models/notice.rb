class Notice < ApplicationRecord
  belongs_to :project
  has_many :error_occurrences

  after_initialize :generate_defaults, if: :new_record?

  default_scope { order(id: :desc) }

  validates :project, presence: true

  private

  def generate_defaults
    self.uuid ||= SecureRandom.uuid
  end
end
