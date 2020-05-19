FactoryBot.define do
  factory :feedback do
    message { "MyString" }
    apply_job
    choice
  end
end
