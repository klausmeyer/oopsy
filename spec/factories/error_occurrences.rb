FactoryBot.define do
  factory :error_occurrence do
    project
    notice
    error_type { "ErrorType" }
    error_message { "Error Message" }
  end
end
