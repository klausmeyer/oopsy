class Project < ApplicationRecord
  has_many :notices

  after_initialize :generate_defaults, if: :new_record?

  validates :name, presence: true, uniqueness: true
  validates :api_key, presence: true, uniqueness: true

  private

  def generate_defaults
    self.api_key ||= SecureRandom.hex(16)
  end
end
