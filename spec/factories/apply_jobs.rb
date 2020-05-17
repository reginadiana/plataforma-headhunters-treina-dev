FactoryBot.define do
  factory :apply_job do
    candidate { nil }
    job_opportunity { nil }
    message { "MyText" }
  end
end
