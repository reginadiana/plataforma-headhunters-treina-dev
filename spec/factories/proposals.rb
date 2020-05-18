FactoryBot.define do
  factory :proposal do
    message { "MyString" }
    job_opportunity { nil }
    candidate { nil }
    status { "MyString" }
  end
end
