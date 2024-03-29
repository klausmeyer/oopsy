class Notice < ApplicationRecord
  include AASM

  belongs_to :project
  has_many :reported_errors, class_name: "Error"

  after_initialize :generate_defaults, if: :new_record?

  default_scope { order(id: :desc) }

  validates :project, presence: true

  aasm column: :state do
    state :received, initial: true
    state :parsed
    state :acknowledged

    event :parsed do
      transitions from: :received, to: :parsed
    end

    event :acknowledge do
      transitions from: :parsed, to: :acknowledged
    end

    event :unacknowledge do
      transitions from: :acknowledged, to: :parsed
    end
  end

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
