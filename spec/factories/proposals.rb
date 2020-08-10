FactoryBot.define do
  factory :proposal do
    message { 'MyString' }
    job_opportunity
    candidate
    status { 'Em espera' }
  end
end
