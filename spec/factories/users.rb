# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@test.com.br" }
    password { '12345678' }

    trait :with_avatar do
      avatar { fixture_file_upload(Rails.root.join('spec', 'support', 'assets', 'camila-avatar.jpg'), 'image/jpg') }
    end
  end
end
