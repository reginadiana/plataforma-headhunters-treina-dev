# frozen_string_literal: true

FactoryBot.define do
  factory :feedback do
    message { 'Ola, gostamos do seu perfil' }
    apply_job
    choice
  end
end
