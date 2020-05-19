FactoryBot.define do
  factory :proposal do
    message { "MyString" }
    job_opportunity 
    candidate 
    status { "MyString" }
  end
end
