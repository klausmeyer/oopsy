module Errors
  module CollectErrorUnities
    extend self

    def call
      errors_without_unity.each do |error|
        error.error_unity = error.project.error_unities.find_or_create_by!(
          error_type:    error.error_type,
          error_message: error.error_message
        )
        error.save!
      end
    end

    private

    def errors_without_unity
      ErrorOccurrence.where(error_unity: nil)
    end
  end
end
