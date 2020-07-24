# frozen_string_literal: true

FactoryBot.define do
  factory :candidate do
    full_name { 'Camila Vegas' }
    social_name { 'Camila' }
    date_of_birth { '16/10/1995' }
    profession { 'Desenvolvedor Backend' }
    profile_description { 'Excelentes capacidades de análise, escrita, raciocínio e de tecnologia da informação' }
    experience { 'Experiencia em analise da dados na empresa Partyou' }
    level
    formation { 'UFABC - Engenharia da Computacao' }
    courses { 'Udemy - Analise de dados' }
    user
  end
end
