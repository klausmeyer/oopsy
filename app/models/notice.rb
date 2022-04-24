class Notice < ApplicationRecord
  belongs_to :project
  has_many :error_occurrences

  after_initialize :generate_defaults, if: :new_record?

  default_scope { order(id: :desc) }

  validates :project, presence: true

  def action
    return if context.nil?

    context["action"]
  end

  def component
    return if context.nil?

    context["component"]
  end

  def hostname
    return if context.nil?

    context["hostname"]
  end

  private

  def generate_defaults
    self.uuid ||= SecureRandom.uuid
  end
end
