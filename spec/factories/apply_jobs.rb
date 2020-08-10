FactoryBot.define do
  factory :apply_job do
    candidate
    job_opportunity
    message { 'Eu, Bianca Rosa, brasileira, Operadora de CNC venho por meio desta me candidatar à vaga de Programador de CNC nesta empresa.' }
  end
end
