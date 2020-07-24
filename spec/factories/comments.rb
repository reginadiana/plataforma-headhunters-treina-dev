FactoryBot.define do
  factory :comment do
    candidate
    headhunter 
    content { 'Ola, gostei do seu perfil' }
  end
end
