# Definindo niveis de especializacao

Level.create!(name: 'Estagiário')
Level.create!(name: 'Auxiliar')
Level.create!(name: 'Júnior')
pleno = Level.create!(name: 'Pleno')
Level.create!(name: 'Sênior')
especialista = Level.create!(name: 'Especialista')
Level.create!(name: 'Diretor')

# Candidatos
User.create!(email: 'dianaregina22@outlook.com.br', password: '123456')
User.create!(email: 'dianaregina22@yahoo.com.br', password: '123456')

# Recrutadores
headhunter_a = Headhunter.create!(email: 'lucas22@outlook.com.br', password: '111111')
headhunter_b = Headhunter.create!(email: 'lucas22@yahoo.com.br', password: '111111')

# Vagas
JobOpportunity.create!(
	title: "Desenvolvedor Rails",
	company: "Rebase",
	description_job: "Desenvolvimento de Plataformas com TDD",
	skills: "Domínio da linguagem Ruby e do framework Ruby on Rails",
	salary_range: "4.000.00",
	level: pleno,
	deadline: "2020-05-14",
	region: "Mocca - SP",
	benefits: "Vale refeição, Academia",
	office_functions: "Contribuir com a evolução arquitetural do software visando manutenibilidade e flexibilização para 				atendimento do negócio.",
	company_expectations: "Profissional ativo e comunicativo",
	headhunter: headhunter_a
)

JobOpportunity.create!(
	title: "Desenvolvedor React",
	company: "Vindi",
	description_job: "Desenvolvimento de Interfaces Dinamicas",
	skills: "Domínio da linguagem JavaScript e do framework React",
	salary_range: "5.000.00",
	level: especialista,
	deadline: "2021-05-14",
	region: "Mogi das Cruzes - SP",
	benefits: "Vale refeição, Academia",
	office_functions: "Contribuir com a evolução arquitetural do software visando manutenibilidade e flexibilização para 				atendimento do negócio.",
	company_expectations: "Profissional ativo e comunicativo",
	headhunter: headhunter_b
)
