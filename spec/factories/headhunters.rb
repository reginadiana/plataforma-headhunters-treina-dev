# frozen_string_literal: true

FactoryBot.define do
  factory :headhunter do
    sequence(:email) { |n| "email#{n}@test.com.br" }
    password { '12345678' }
  end
end
