FactoryBot.define do
  factory :notice do
    project
    raw { {"dummy" => "true"} }
  end
end
