# frozen_string_literal: true

FactoryBot.define do
  factory :proposal do
    message { 'MyString' }
    job_opportunity
    candidate
    status { 'Em espera' }
  end
end
