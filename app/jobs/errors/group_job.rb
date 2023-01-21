class Errors::GroupJob < ApplicationJob
  queue_as :default

  def perform(*args)
    ungrouped_errors.each do |error|
      error.error_group = error.project.error_groups.find_or_create_by!(name: error.error_type)
      error.save!
    end
  end

  private

  def ungrouped_errors
    Error.where(error_group: nil)
  end
end
