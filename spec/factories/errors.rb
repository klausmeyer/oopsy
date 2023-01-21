FactoryBot.define do
  factory :error do
    notice
    error_type { "ErrorType" }
    error_message { "Error Message" }
  end
end
