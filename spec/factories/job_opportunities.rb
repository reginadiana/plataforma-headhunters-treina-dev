FactoryBot.define do
  factory :job_opportunity do
    title { "Desenvolvedor Rails" }
    company { "Rebase" }
    description_job { "Desenvolvimento de Plataformas com TDD" }
    skills { "Domínio da linguagem Ruby e do framework Ruby on Rails" }
    salary_range { "4000.00" }
    level 
    deadline { "14/09/2020" }
    region { "Mocca - SP" }
    benefits { "Vale refeição, Academia" }
    office_functions { "Contribuir com a evolução arquitetural do software visando manutenibilidade e flexibilização para atendimento do negócio." }
    company_expectations { "Profissional ativo e comunicativo" }
    headhunter
  end
end
