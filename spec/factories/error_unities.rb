FactoryBot.define do
  factory :error_unity do
    project
    error_type { "ErrorType" }
    error_message { "Error Message" }
  end
end
