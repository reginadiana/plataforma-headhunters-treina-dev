FactoryBot.define do
  factory :candidate do
    full_name { "MyString" }
    social_name { "MyString" }
    date_of_birth { "2020-05-16" }
    profile_description { "MyString" }
    experience { "MyString" }
    user { nil }
  end
end
